package com.tealeaf.plugin.plugins;
import java.util.Map;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import com.tealeaf.EventQueue;
import com.tealeaf.TeaLeaf;
import com.tealeaf.logger;
import android.content.pm.PackageManager;
import android.content.pm.ApplicationInfo;
import android.os.Bundle;
import java.util.HashMap;

import com.tealeaf.plugin.IPlugin;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Intent;
import android.content.Context;
import android.content.DialogInterface;
import android.util.Log;

import com.tealeaf.EventQueue;
import com.tealeaf.event.*;

import LEADBOLT_PACKAGE.AdController;
import LEADBOLT_PACKAGE.AdListener;

public class LeadBoltPlugin implements IPlugin {
	Context _ctx;

	private AdController ad;
	private Activity mActivity;

	public class LeadboltAdNotAvailable extends com.tealeaf.event.Event {

		public LeadboltAdNotAvailable() {
			super("LeadboltAdNotAvailable");
		}
	}

	public class LeadboltAdAvailable extends com.tealeaf.event.Event {

		public LeadboltAdAvailable() {
			super("LeadboltAdAvailable");
		}
	}

	public class LeadboltAdDismissed extends com.tealeaf.event.Event {

		public LeadboltAdDismissed() {
			super("LeadboltAdDismissed");
		}
	}

	private class PluginDelegate implements AdListener {

		@Override
		public void onAdLoaded() {
		}

		@Override
		public void onAdClicked() {
			logger.log("{leadbolt-native} ad clicked");
		}

		@Override
		public void onAdClosed() {
			logger.log("{leadbolt-native} ad closed");
			EventQueue.pushEvent(new LeadboltAdDismissed());
		}

		@Override
		public void onAdCompleted() {
		}

		@Override
		public void onAdFailed() {
			logger.log("{leadbolt-native} ad not available");
			EventQueue.pushEvent(new LeadboltAdNotAvailable());
		}

		@Override
		public void onAdProgress() {
		}

		@Override
		public void onAdAlreadyCompleted() {
		}

		@Override
		public void onAdPaused() {
		}

		@Override
		public void onAdResumed() {
		}

		@Override
		public void onAdCached() {
			logger.log("{leadbolt-native} available");
			EventQueue.pushEvent(new LeadboltAdAvailable());
		}
	}

	public LeadBoltPlugin() {
	}

	public void onCreateApplication(Context applicationContext) {
		_ctx = applicationContext;
	}

	public void onCreate(Activity activity, Bundle savedInstanceState) {
		mActivity = activity;
		String leadBoltPackage = "LEADBOLT_PACKAGE";
		PackageManager manager = activity.getPackageManager();
		String sectionId = "";

		try {
			Bundle meta = manager.getApplicationInfo(activity.getPackageName(), PackageManager.GET_META_DATA).metaData;
			if (meta != null) {
				sectionId = meta.get("LEADBOLT_SECTION_ID").toString();
			}
		} catch (Exception e) {
			android.util.Log.d("EXCEPTION", "" + e.getMessage());
		}

		logger.log("{leadbolt} Initializing LeadBolt ad framework with package:", leadBoltPackage, sectionId);

		this.ad = new AdController(mActivity, sectionId, new PluginDelegate());
	}

	public void showInterstitial(String jsonData) {
		final AdController ad = this.ad;
		mActivity.runOnUiThread(new Runnable() {
			public void run() {
				ad.loadAd();
			}
		});
	}

	public void cacheInterstitial(String jsonData) {
		this.ad.loadAdToCache();
	}

	public void onResume() {
	}

	public void onStart() {
	}

	public void onPause() {
	}

	public void onStop() {
	}

	public void onDestroy() {
		this.ad.destroyAd();
	}

	public void onNewIntent(Intent intent) {
	}

	public void setInstallReferrer(String referrer) {
	}

	public void onActivityResult(Integer request, Integer result, Intent data) {
	}

	public void logError(String error) {
	}

	public boolean consumeOnBackPressed() {
		return true;
	}

	public void onBackPressed() {
	}
}
