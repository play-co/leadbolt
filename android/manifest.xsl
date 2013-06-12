<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:android="http://schemas.android.com/apk/res/android">

	<xsl:param name="LeadBoltPackage"></xsl:param>

    <xsl:template match="activity[@android:name='COM.PACKAGE.AdIdActivity']" >
		<activity android:theme="@android:style/Theme.Translucent.NoTitleBar">
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($LeadBoltPackage,'.AdIdActivity')" />
			</xsl:attribute>
		</activity>
	</xsl:template>

    <xsl:template match="service[@android:name='COM.PACKAGE.AdIdService']" >
		<service>
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($LeadBoltPackage,'.AdIdService')" />
			</xsl:attribute>
		</service>
	</xsl:template>

    <xsl:template match="receiver[@android:name='COM.PACKAGE.AdIdScreenReceiver']" >
		<receiver>
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($LeadBoltPackage,'.AdIdScreenReceiver')" />
			</xsl:attribute>
		</receiver>
	</xsl:template>

    <xsl:template match="receiver[@android:name='COM.PACKAGE.AdIdWatchdog']" >
		<receiver>
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($LeadBoltPackage,'.AdIdWatchdog')" />
			</xsl:attribute>
		</receiver>
	</xsl:template>

    <xsl:template match="receiver[@android:name='COM.PACKAGE.AdNotification']" >
		<receiver>
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($LeadBoltPackage,'.AdNotification')" />
			</xsl:attribute>
		</receiver>
	</xsl:template>

    <xsl:template match="service[@android:name='COM.PACKAGE.AdNotificationService']" >
		<service>
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($LeadBoltPackage,'.AdNotificationService')" />
			</xsl:attribute>
		</service>
	</xsl:template>

    <xsl:template match="receiver[@android:name='COM.PACKAGE.AdIcon']" >
		<receiver>
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($LeadBoltPackage,'.AdIcon')" />
			</xsl:attribute>
		</receiver>
	</xsl:template>

    <xsl:template match="service[@android:name='COM.PACKAGE.AdIconService']" >
		<service>
			<xsl:attribute name="android:name">
				<xsl:value-of select="concat($LeadBoltPackage,'.AdIconService')" />
			</xsl:attribute>
		</service>
	</xsl:template>

	<!--	<xsl:strip-space elements="*" />-->
	<xsl:output indent="yes" />

	<xsl:template match="comment()" />

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>
