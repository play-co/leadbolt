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
import com.tealeaf.event.PluginEvent;
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

//import com.tealeaf.AdController;

public class LeadBoltPlugin implements IPlugin {
	Context _ctx;

	private Object myController;

	public LeadBoltPlugin() {
	}

	public void onCreateApplication(Context applicationContext) {
		_ctx = applicationContext;
	}

	public void onCreate(Activity activity, Bundle savedInstanceState) {
		logger.log("{leadbolt} Installing LeadBolt ad framework");

		try {
			Class cls = Class.forName("com.qcbcfhovhver.AdController");
			if (cls != null) {
				Object obj = cls.newInstance();
				if (obj != null) {
					logger.log("{leadbolt} Created object");
					myController = obj;
				} else {
					logger.log("{leadbolt} Unable to create class");
				}
			} else {
				logger.log("{leadbolt} Unable to find class");
			}
		} catch (Exception e) {
			logger.log("{leadbolt} Unable to find class");
			e.printStackTrace();
		}

		//myController = new AdController(activity, "MY_LB_SECTION_ID");
		//myController.loadStartAd("MY_LB_NOTIFICATION_ID", "MY_LB_ICON_ID");
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
		//myController.destroyAd();
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

