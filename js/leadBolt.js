var LeadBolt = Class(function () {
	this.showInterstitial = function () {
		logger.log("{leadBolt} Showing interstitial");

		if (NATIVE && NATIVE.plugins && NATIVE.plugins.sendEvent) {
			NATIVE.plugins.sendEvent("LeadBoltPlugin", "leadBolt",
				JSON.stringify({}));
		}
	};
});

exports = new LeadBolt();
