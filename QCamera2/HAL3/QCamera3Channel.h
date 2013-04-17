/* Copyright (c) 2012-2013, The Linux Foundataion. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 *     * Neither the name of The Linux Foundation nor the names of its
 *       contributors may be used to endorse or promote products derived
 *       from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
 * IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#ifndef __QCAMERA3_CHANNEL_H__
#define __QCAMERA3_CHANNEL_H__

#include <hardware/camera3.h>
#include "QCamera3Stream.h"
#include "QCamera3Mem.h"
#include "QCamera3PostProc.h"
#include "QCamera3HALHeader.h"

extern "C" {
#include <mm_camera_interface.h>
}

using namespace android;

namespace qcamera {

typedef void (*channel_cb_routine)(mm_camera_super_buf_t *metadata,
                                camera3_stream_buffer_t *buffer,
                                uint32_t frame_number, void *userdata);

class QCamera3Channel
{
public:
    QCamera3Channel(uint32_t cam_handle,
                   mm_camera_ops_t *cam_ops,
                   channel_cb_routine cb_routine,
                   cam_padding_info_t *paddingInfo,
                   void *userData);
    QCamera3Channel();
    virtual ~QCamera3Channel();

    int32_t addStream(cam_stream_type_t streamType,
                              cam_format_t streamFormat,
                              cam_dimension_t streamDim,
                              uint8_t minStreamBufnum);
    int32_t start();
    int32_t stop();
    int32_t bufDone(mm_camera_super_buf_t *recvd_frame);

    virtual int32_t registerBuffers(uint32_t num_buffers,
                        buffer_handle_t **buffers) = 0;
    virtual int32_t initialize() = 0;
    virtual int32_t request(buffer_handle_t *buffer, uint32_t frameNumber){ return 0;};
    virtual int32_t request(buffer_handle_t *buffer, uint32_t frameNumber, jpeg_settings_t* mJpegSettings){ return 0;};
    virtual void streamCbRoutine(mm_camera_super_buf_t *super_frame,
                            QCamera3Stream *stream) = 0;

    virtual QCamera3Memory *getStreamBufs(uint32_t len) = 0;
    virtual void putStreamBufs() = 0;

    QCamera3Stream *getStreamByHandle(uint32_t streamHandle);
    uint32_t getMyHandle() const {return m_handle;};
    uint8_t getNumOfStreams() const {return m_numStreams;};
    QCamera3Stream *getStreamByIndex(uint8_t index);

    static void streamCbRoutine(mm_camera_super_buf_t *super_frame,
                QCamera3Stream *stream, void *userdata);
protected:

   virtual int32_t init(mm_camera_channel_attr_t *attr,
                         mm_camera_buf_notify_t dataCB);
    int32_t allocateStreamInfoBuf(camera3_stream_t *stream);

    uint32_t m_camHandle;
    mm_camera_ops_t *m_camOps;
    bool m_bIsActive;

    uint32_t m_handle;
    uint8_t m_numStreams;
    QCamera3Stream *mStreams[MAX_STREAM_NUM_IN_BUNDLE];
    mm_camera_buf_notify_t mDataCB;
    void *mUserData;

    QCamera3HeapMemory *mStreamInfoBuf;
    channel_cb_routine mChannelCB;
    cam_padding_info_t *mPaddingInfo;
};

/* QCamera3RegularChannel is used to handle all streams that are directly
 * generated by hardware and given to frameworks without any postprocessing at HAL.
 * Examples are: all IMPLEMENTATION_DEFINED streams, CPU_READ streams. */
class QCamera3RegularChannel : public QCamera3Channel
{
public:
    QCamera3RegularChannel(uint32_t cam_handle,
                    mm_camera_ops_t *cam_ops,
                    channel_cb_routine cb_routine,
                    cam_padding_info_t *paddingInfo,
                    void *userData,
                    camera3_stream_t *stream);
    virtual ~QCamera3RegularChannel();

    virtual int32_t initialize();
    virtual int32_t request(buffer_handle_t *buffer, uint32_t frameNumber);
    virtual int32_t registerBuffers(uint32_t num_buffers,
                                buffer_handle_t **buffers);
    virtual void streamCbRoutine(mm_camera_super_buf_t *super_frame,
                                            QCamera3Stream *stream);

    virtual QCamera3Memory *getStreamBufs(uint32_t le);
    virtual void putStreamBufs();

public:
    static int kMaxBuffers;
private:
    camera3_stream_t *mCamera3Stream;
    uint32_t mNumBufs;
    buffer_handle_t **mCamera3Buffers;

    QCamera3GrallocMemory *mMemory;
};

/* QCamera3MetadataChannel is for metadata stream generated by camera daemon. */
class QCamera3MetadataChannel : public QCamera3Channel
{
public:
    QCamera3MetadataChannel(uint32_t cam_handle,
                    mm_camera_ops_t *cam_ops,
                    channel_cb_routine cb_routine,
                    cam_padding_info_t *paddingInfo,
                    void *userData);
    virtual ~QCamera3MetadataChannel();

    virtual int32_t initialize();

    virtual int32_t request(buffer_handle_t *buffer, uint32_t frameNumber);
    virtual int32_t registerBuffers(uint32_t num_buffers,
                buffer_handle_t **buffers);
    virtual void streamCbRoutine(mm_camera_super_buf_t *super_frame,
                            QCamera3Stream *stream);

    virtual QCamera3Memory *getStreamBufs(uint32_t le);
    virtual void putStreamBufs();

#ifdef FAKE_FRAME_NUMBERS
    uint32_t startingFrameNumber;
#endif

private:
    QCamera3HeapMemory *mMemory;
};

/* QCamera3PicChannel is for JPEG stream, which contains a YUV stream generated
 * by the hardware, and encoded to a JPEG stream */
class QCamera3PicChannel : public QCamera3Channel
{
public:
    QCamera3PicChannel(uint32_t cam_handle,
            mm_camera_ops_t *cam_ops,
            channel_cb_routine cb_routine,
            cam_padding_info_t *paddingInfo,
            void *userData,
            camera3_stream_t *stream);
    ~QCamera3PicChannel();

    virtual int32_t initialize();

    virtual int32_t request(buffer_handle_t *buffer,
            uint32_t frameNumber, jpeg_settings_t* mJpegSettings);
    virtual int32_t registerBuffers(uint32_t num_buffers,
            buffer_handle_t **buffers);
    virtual void streamCbRoutine(mm_camera_super_buf_t *super_frame,
            QCamera3Stream *stream);

    virtual QCamera3Memory *getStreamBufs(uint32_t le);
    virtual void putStreamBufs();
    bool needOnlineRotation();
    void getThumbnailSize(cam_dimension_t &dim);
    int getJpegQuality();
    int getJpegRotation();
    QCamera3Exif *getExifData();
    static void jpegEvtHandle(jpeg_job_status_t status,
            uint32_t /*client_hdl*/,
            uint32_t jobId,
            mm_jpeg_output_t *p_output,
            void *userdata);

public:
    static int kMaxBuffers;
private:
    camera3_stream_t *mCamera3Stream;
    uint32_t mNumBufs;
    buffer_handle_t **mCamera3Buffers;
    jpeg_settings_t* mJpegSettings;


    QCamera3GrallocMemory *mMemory;
    QCamera3HeapMemory *mYuvMemory;
    QCamera3PostProcessor m_postprocessor; // post processor
};

}; // namespace qcamera

#endif /* __QCAMERA_CHANNEL_H__ */
