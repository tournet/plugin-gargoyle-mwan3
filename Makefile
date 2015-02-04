include $(TOPDIR)/rules.mk

PKG_NAME:=plugin_gargoyle_mwan3
PKG_VERSION:=1.0.0
PKG_RELEASE:=1


PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/plugin-gargoyle-mwan3
	SECTION:=admin
	CATEGORY:=Administration
	SUBMENU:=Gargoyle Web Interface
	TITLE:=mwan3 for Gargoyle
	MAINTAINER:=Karol Wójcik <karol508.dev@windowslive.com>
	DEPENDS:=+gargoyle +mwan3
	PKGARCH:=all
endef

define Package/plugin-gargoyle-mwan3/description
	mwan3 for Gargoyle
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/plugin-gargoyle-mwan3/postinst
#!/bin/sh

if [ -z "$${IPKG_INSTROOT}" ]; then
	menu_name="mwan3"
	[ -n `which i18n` ] && {
		mn=$$(i18n-menu gargoyle.display.connection_mwan3)
		if [ -n "$$mn" ] ; then
			menu_name="$$mn"
		fi
	}
	uci set gargoyle.display.connection_mwan3="$$menu_name"
	uci set gargoyle.scripts.connection_mwan3='mwan3.sh'
	uci set gargoyle.connection.mwan3='550'
	uci commit
fi
endef

define Package/plugin-gargoyle-mwan3/postrm
#!/bin/sh

if [ -z "$${IPKG_INSTROOT}" ]; then
	uci del gargoyle.display.connection_mwan3
	uci del gargoyle.scripts.connection_mwan3
	uci del gargoyle.connection.mwan3
	uci commit
fi
endef

define Package/plugin-gargoyle-mwan3/install
	$(INSTALL_DIR) $(1)
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,plugin-gargoyle-mwan3))
