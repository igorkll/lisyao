#include "main.h"
#include "fade.h"

#define TITLE_WIDTH 8
#define TITLE_HEIGHT 16
#define TITLE_MARGIN 8

const char* TAG = "otter_smartpet";

tsgl_display display;
tsgl_framebuffer framebuffer;

tsgl_pos width;
tsgl_pos height;
tsgl_colormode colormode;

void app_main() {
    colormode = settings.driver->colormode;

    settings.backlight_init = true;
    settings.backlight_pin = BL;
    settings.backlight_value = 0;

    ESP_ERROR_CHECK(tsgl_filesystem_mount_fatfs("/firmware", "firmware"));

    ESP_ERROR_CHECK(tsgl_framebuffer_init(&framebuffer, colormode, settings.width, settings.height, BUFFER));
    if (USE_HARDWARE_ROTATE) {
        tsgl_framebuffer_hardwareRotate(&framebuffer, ROTATE);
    } else {
        tsgl_framebuffer_rotate(&framebuffer, ROTATE);
    }
    width = framebuffer.width;
    height = framebuffer.height;

    ESP_ERROR_CHECK(tsgl_spi_initManual(framebuffer.buffersize, SPI, SPI_MOSI, SPI_MISO, SPI_CLK));
    ESP_ERROR_CHECK(tsgl_display_spi(&display, settings, SPI, FREQ, DC, CS, RST));
    tsgl_display_incompleteSending(&display, false, NULL);
    if (USE_HARDWARE_ROTATE) {
        tsgl_display_rotate(&display, ROTATE);
    }

    // --------------- sound

    tsgl_sound_enableGlobalTimer(SOUND_GLOBAL_TIMER_FREQ, MAX_SOUNDS_COUNT);
    tsgl_sound_newLedcOutput(SPEAKER_PIN);

    
    tsgl_sound_load_pcmEx(music, SOUND_BUFFER_SIZE, 0, "/firmware/music.pcm", MUSIC_SAMPLERATE, 1, 1, PCM_FORMAT, USE_SOUND_DOUBLE_BUFFER)
    tsgl_sound_setLoop(music, true);
    tsgl_sound_setOutputs(music, &sound_output, 1, false);
    tsgl_sound_setVolume(music, 1);
    tsgl_sound_play(music);
    
    while (true) {

        fade_setBacklight(255);
        tsgl_delay(1000);
    }
}