var capacitorAudioToggle = (function (exports, core) {
    'use strict';

    const AudioToggle = core.registerPlugin('AudioToggle', {
        web: () => Promise.resolve().then(function () { return web; }).then(m => new m.AudioToggleWeb()),
    });

    class AudioToggleWeb extends core.WebPlugin {
        async selectDevice() {
            throw this.unimplemented('Not implemented on web.');
        }
        async setRingtoneMode() {
            throw this.unimplemented('Not implemented on web.');
        }
        async enable() {
            throw this.unimplemented('Not implemented on web.');
        }
        async disable() {
            throw this.unimplemented('Not implemented on web.');
        }
        async reset() {
            throw this.unimplemented('Not implemented on web.');
        }
        async getAvailableDevices() {
            throw this.unimplemented('Not implemented on web.');
        }
        async getSelectedDevice() {
            throw this.unimplemented('Not implemented on web.');
        }
        async checkPermissions() {
            throw this.unimplemented('Not implemented on web.');
        }
        async requestPermissions() {
            throw this.unimplemented('Not implemented on web.');
        }
        async isBluetoothEnabled() {
            throw this.unimplemented('Not implemented on web.');
        }
        async openBluetoothSettings() {
            throw this.unimplemented('Not implemented on web.');
        }
        async openAppSettings() {
            throw this.unimplemented('Not implemented on web.');
        }
        addListener() {
            throw this.unimplemented('Not implemented on web.');
        }
        ;
    }

    var web = /*#__PURE__*/Object.freeze({
        __proto__: null,
        AudioToggleWeb: AudioToggleWeb
    });

    exports.AudioToggle = AudioToggle;

    Object.defineProperty(exports, '__esModule', { value: true });

    return exports;

})({}, capacitorExports);
//# sourceMappingURL=plugin.js.map
