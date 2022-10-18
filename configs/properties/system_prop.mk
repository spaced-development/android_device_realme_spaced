# Apex
PRODUCT_PRODUCT_PROPERTIES += \
    ro.apex.updatable=false

# Audio
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.vc_call_vol_steps=7

# Bluetooth
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.a2dp_offload.disabled=true \
    ro.bluetooth.a2dp_offload.supported=false

# Enable system-side generic bluetooth audio HAL
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.system_audio_hal.enabled=1

# Blurs
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.surface_flinger.supports_background_blur=1

# CABC
PRODUCT_SYSTEM_PROPERTIES += \
    persist.cabc_profile=2

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.renderengine.backend=skiaglthreaded

# Dexopt
PRODUCT_SYSTEM_PROPERTIES += \
    pm.dexopt.first-boot=quicken \
    pm.dexopt.bg-dexopt=everything

# Camera
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.android.camera,com.google.camera \
    vendor.camera.aux.packageblacklist=org.telegram.messenger,com.microsoft.teams,com.discord

# Fingerprint
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.realme.lockstate=0

# IMS
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1

# Log
PRODUCT_PROPERTY_OVERRIDES += \
    persist.log.tag.GED=S \
    persist.log.tag.hwcomposer=S \
    persist.log.tag.libnfc_nci=S \
    persist.log.tag.libPowerHal=S \
    persist.log.tag.mTEE=S \
    persist.log.tag.mtkpower@impl=S

# Gralloc4
PRODUCT_SYSTEM_PROPERTIES += \
    persist.log.tag.gralloc4=S

# Hardware Acceleration
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    video.accelerate.hw=1 \
    debug.sf.hw=1 \
    debug.performance.tuning=1 \
    debug.egl.profiler=1 \
    debug.egl.hw=1 \
    debug.composition.type=gpu

# Tweak the memory management of the device, enable more background apps.. etc..
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.fha_enable=true \
    ro.sys.fw.bg_apps_limit=32 \
    ro.config.dha_cached_max=16 \
    ro.config.dha_empty_max=42 \
    ro.config.dha_empty_init=32 \
    ro.config.dha_lmk_scale=0.545 \
    ro.config.dha_th_rate=2.3 \
    ro.config.sdha_apps_bg_max=64 \
    ro.config.sdha_apps_bg_min=8

# Iorap
PRODUCT_PROPERTY_OVERRIDES += \
    persist.device_config.runtime_native_boot.iorap_readahead_enable=true

# OMX
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    debug.stagefright.omx_default_rank.sw-audio=1 \
    debug.stagefright.omx_default_rank=0 \
    debug.stagefright.ccodec=0

# Media Transcoding
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.fuse.transcode_default=false

# Performance
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.mtk_perf_simple_start_win=1 \
    ro.mtk_perf_fast_start_win=1 \
    ro.mtk_perf_response_time=1

# Privapp permissions whitelisting
PRODUCT_PRODUCT_PROPERTIES += \
    ro.control_privapp_permissions=log

# Surfaceflinger
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    debug.sf.latch_unsignaled=1 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.vsync_event_phase_offset_ns=2000000 \
    ro.surface_flinger.vsync_sf_event_phase_offset_ns=6000000 \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true

# Zygote
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.device_config.runtime_native.usap_pool_enabled=true

# ZRAM
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.zram.mark_idle_delay_mins=60 \
    ro.zram.first_wb_delay_mins=1440 \
    ro.zram.periodic_wb_delay_hours=24

# SOC information
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.soc.manufacturer=MediaTek \
    ro.soc.model=MT6781

# Elixir stuff
PRODUCT_PRODUCT_PROPERTIES += \
    org.elixir.device=realme 8i/narzo 50