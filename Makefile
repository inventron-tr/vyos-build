build_dir := build

.PHONY: all
all:
	@echo "Make what specifically?"
	@echo "The most common target is 'iso'"

.PHONY: check_build_config
check_build_config:
	@scripts/check-config

.PHONY: prepare
prepare:
	@set -e
	@echo "Starting VyOS ISO image build"

	rm -rf build/config/*
	mkdir -p build/config
	cp -r data/live-build-config/* build/config/
	cd packages
	rm -f *.deb
	wget http://192.168.1.3:8090/linux-image-4.19.114-armhf-vyos_4.19.114-1_armhf.deb
	wget http://192.168.1.3:8090/linux-headers-4.19.114-armhf-vyos_4.19.114-1_armhf.deb
	wget http://192.168.1.3:8090/linux-libc-dev_4.19.114-1_armhf.deb
	wget http://192.168.1.3:8090/vyatta-cfg-system_0.20.44+vyos2+current22_armhf.deb
	wget http://192.168.1.3:8090/vyatta-bash_4.1-3+vyos2+current2_armhf.deb
	wget http://192.168.1.3:8090/vyatta-op_0.14.0+vyos2+current8_all.deb
	wget http://192.168.1.3:8090/vyatta-cfg_0.102.0+vyos2+current4_armhf.deb
	wget http://192.168.1.3:8090/vyatta-config-mgmt_0.34+vyos2+current2_all.deb
	wget http://192.168.1.3:8090/vyatta-cfg-firewall_0.14.0+vyos2+current2_all.deb
	wget http://192.168.1.3:8090/vyatta-op-firewall_0.11.0+vyos2+current1_all.deb
	wget http://192.168.1.3:8090/vyatta-cfg-qos_0.15.42+vyos2+current1_all.deb
	wget http://192.168.1.3:8090/vyatta-op-qos_0.12.27+vyos2+current1_all.deb
	wget http://192.168.1.3:8090/vyatta-cfg-quagga_0.19.1+vyos2+current9_all.deb
	wget http://192.168.1.3:8090/vyatta-op-quagga_0.11.35+vyos2+current1_all.deb
	wget http://192.168.1.3:8090/vyatta-cfg-vpn_0.12.105+vyos2+current6_all.deb
	wget http://192.168.1.3:8090/vyatta-op-vpn_0.15.0+vyos2+current2+nmu1_all.deb
	wget http://192.168.1.3:8090/vyatta-cluster_0.11.25+vyos2+current1_all.deb
	wget http://192.168.1.3:8090/vyatta-conntrack_0.54+vyos2+current1_armhf.deb
	wget http://192.168.1.3:8090/vyatta-webproxy_0.2.110+vyos2+current2_all.deb
	wget http://192.168.1.3:8090/vyatta-zone_0.15+vyos2+current1_all.deb
	wget http://192.168.1.3:8090/vyos-nhrp_0.1.0+vyos2+current1_all.deb
	wget http://192.168.1.3:8090/vyatta-wanloadbalance_0.13.70+vyos2+current1_armhf.deb
	wget http://192.168.1.3:8090/vyos-1x_1.3dev0-1935-gffb3e2dc_all.deb
	wget http://192.168.1.3:8090/libvyatta-cfg1_0.102.0+vyos2+current4_armhf.deb
	wget http://192.168.1.3:8090/ipaddrcheck_1.1_armhf.deb
	wget http://192.168.1.3:8090/accel-ppp_1.12.0-87-gbefc6e4_armhf.deb
	wget http://192.168.1.3:8090/hvinfo_1.2.0_armhf.deb
	wget http://192.168.1.3:8090/vyatta-biosdevname_0.3.11+vyos2+current2_armhf.deb
	wget http://192.168.1.3:8090/libvyosconfig0_0.0.10_armhf.deb
	wget http://192.168.1.3:8090/libpam-radius-auth_1.5.0-cl3u1_armhf.deb
	wget http://192.168.1.3:8090/strongswan-charon_5.7.2-1_armhf.deb
	wget http://192.168.1.3:8090/libstrongswan-standard-plugins_5.7.2-1_armhf.deb
	wget http://192.168.1.3:8090/libstrongswan-extra-plugins_5.7.2-1_armhf.deb
	wget http://192.168.1.3:8090/libstrongswan_5.7.2-1_armhf.deb
	wget http://192.168.1.3:8090/strongswan-swanctl_5.7.2-1_armhf.deb
	wget http://192.168.1.3:8090/strongswan-starter_5.7.2-1_armhf.deb
	wget http://192.168.1.3:8090/strongswan-scepclient_5.7.2-1_armhf.deb
	wget http://192.168.1.3:8090/strongswan-pki_5.7.2-1_armhf.deb
	wget http://192.168.1.3:8090/strongswan-libcharon_5.7.2-1_armhf.deb
	wget http://192.168.1.3:8090/strongswan_5.7.2-1_all.deb
	wget http://192.168.1.3:8090/mdns-repeater_0.1+vyos2+current0_armhf.deb
	wget http://192.168.1.3:8090/ppp_2.4.7-2+4.1+vyos3+equuleus1_armhf.deb
	wget http://192.168.1.3:8090/vyos-opennhrp_0.14.1-1+vyos3+equuleus1_armhf.deb
	wget http://192.168.1.3:8090/vyos-utils_0.0.3_armhf.deb
	wget http://192.168.1.3:8090/wireguard_0.0.20191219-1_all.deb
	wget http://192.168.1.3:8090/wireguard-dkms_0.0.20191219-1_all.deb
	wget http://192.168.1.3:8090/wireguard-tools_0.0.20191219-1_armhf.deb
	wget http://192.168.1.3:8090/radius-shell_1.5.0-cl3u1_armhf.deb
	wget http://192.168.1.3:8090/udp-broadcast-relay_0.1+vyos3+equuleus1_armhf.deb
	wget http://192.168.1.3:8090/vyatta-config-migrate_0.13.65+vyos2+current1_all.deb
	wget http://192.168.1.3:8090/libnss-mapuser_1.1.0-cl3u1_armhf.deb
	wget http://192.168.1.3:8090/vyos-netplug_1.2.9.2-3+equuleus_armhf.deb
	wget http://192.168.1.3:8090/keepalived_2.0.17+vyos1.2_armhf.deb
	cd ..
	@scripts/live-build-config
	@scripts/import-local-packages

	@scripts/make-version-file

	@scripts/build-flavour

.PHONY: iso
.ONESHELL:
iso: check_build_config clean prepare
	@echo "It's not like I'm building this specially for you or anything!"
	cd $(build_dir)
	set -o pipefail
	lb build 2>&1 | tee build.log; if [ $$? -ne 0 ]; then exit 1; fi
	cd ..
	@scripts/copy-image
	exit 0

.PHONY: prepare-package-env
.ONESHELL:
prepare-package-env:
	@set -e
	@scripts/pbuilder-config
	@scripts/pbuilder-setup

.PHONY: qemu
.ONESHELL:
qemu:
	@set -e
	@scripts/check-vm-build-env
	@scripts/build-qemu-image

.PHONY: vagrant-libvirt
.ONESHELL:
vagrant-libvirt:
	@set -e
	@scripts/check-vm-build-env
	@scripts/build-vagrant-libvirt-box

.PHONY: vmware
.ONESHELL:
vmware: clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	mkdir -p build/config/includes.chroot/etc/cloud/cloud.cfg.d
	cp tools/cloud-init/vmware/90_dpkg.cfg build/config/includes.chroot/etc/cloud/cloud.cfg.d/
	cp tools/cloud-init/cloud-init.list.chroot build/config/package-lists/
	cp -f tools/cloud-init/vmware/config.boot.default build/config/includes.chroot/opt/vyatta/etc/
	cd $(build_dir)
	@../scripts/build-vmware-image

.PHONY: hyperv
.ONESHELL:
hyperv:
	@set -e
	@scripts/check-vm-build-env
	@scripts/build-hyperv-image

.PHONY: clearfog
.ONESHELL:
clearfog: clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	cd $(build_dir)
	@../scripts/build-clearfog-image

.PHONY: azure
.ONESHELL:
azure: clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	cp tools/cloud-init/azure/99-walinuxagent.chroot build/config/hooks/live/
	cp tools/cloud-init/azure/vyos-azure.list.chroot build/config/package-lists/
	cp tools/cloud-init/cloud-init.list.chroot build/config/package-lists/
	cp -f tools/cloud-init/azure/config.boot.default build/config/includes.chroot/opt/vyatta/etc/
	cd $(build_dir)
	@../scripts/build-azure-image

.PHONY: GCE
.ONESHELL:
GCE: clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	mkdir -p build/config/includes.chroot/etc/cloud/cloud.cfg.d
	cp tools/cloud-init/GCE/90_dpkg.cfg build/config/includes.chroot/etc/cloud/cloud.cfg.d/
	cp tools/cloud-init/cloud-init.list.chroot build/config/package-lists/
	cp -f tools/cloud-init/GCE/config.boot.default build/config/includes.chroot/opt/vyatta/etc/
	cd $(build_dir)
	@../scripts/build-GCE-image

.PHONY: GCE-debug
.ONESHELL:
GCE-debug: clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	mkdir -p build/config/includes.chroot/etc/cloud/cloud.cfg.d
	cp tools/cloud-init/99-debug-user.chroot build/config/hooks/live/
	cp tools/cloud-init/GCE/90_dpkg.cfg build/config/includes.chroot/etc/cloud/cloud.cfg.d/
	cp tools/cloud-init/cloud-init.list.chroot build/config/package-lists/
	cp -f tools/cloud-init/GCE/config.boot.default-debug build/config/includes.chroot/opt/vyatta/etc/config.boot.default
	cd $(build_dir)
	@../scripts/build-GCE-image

.PHONY: AWS
.ONESHELL:
AWS: clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	mkdir -p build/config/includes.chroot/etc/cloud/cloud.cfg.d
	cp tools/cloud-init/AWS/90_dpkg.cfg build/config/includes.chroot/etc/cloud/cloud.cfg.d/
	cp tools/cloud-init/AWS/cloud-init.list.chroot build/config/package-lists/
	cp -f tools/cloud-init/AWS/config.boot.default build/config/includes.chroot/opt/vyatta/etc/
	cd $(build_dir)
	lb build 2>&1 | tee build.log
	cd ..
	@scripts/copy-image

.PHONY: openstack
.ONESHELL:
openstack: clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	mkdir -p build/config/includes.chroot/etc/cloud/cloud.cfg.d
	cp tools/cloud-init/openstack/90_dpkg.cfg build/config/includes.chroot/etc/cloud/cloud.cfg.d/
	cp tools/cloud-init/cloud-init.list.chroot build/config/package-lists/
	cp -f tools/cloud-init/openstack/config.boot.default build/config/includes.chroot/opt/vyatta/etc/
	cd $(build_dir)
	lb build 2>&1 | tee build.log
	cd ..
	@scripts/copy-image

.PHONY: oracle
.ONESHELL:
oracle: clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	mkdir -p build/config/includes.chroot/etc/cloud/cloud.cfg.d
	cp tools/cloud-init/OCI/90_dpkg.cfg build/config/includes.chroot/etc/cloud/cloud.cfg.d/
	cp tools/cloud-init/cloud-init.list.chroot build/config/package-lists/
	cp -f tools/cloud-init/OCI/config.boot.default build/config/includes.chroot/opt/vyatta/etc/
	cd $(build_dir)
	@../scripts/build-oracle-image

.PHONY: PACKET
.ONESHELL:
PACKET: clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	mkdir -p build/config/includes.chroot/etc/cloud/cloud.cfg.d
	cp tools/cloud-init/99-disable-networking.chroot build/config/hooks/live/
	cp tools/cloud-init/PACKET/90_dpkg.cfg build/config/includes.chroot/etc/cloud/cloud.cfg.d/
	cp tools/cloud-init/cloud-init.list.chroot build/config/package-lists/
	cp -f tools/cloud-init/PACKET/config.boot.default build/config/includes.chroot/opt/vyatta/etc/
	cd $(build_dir)
	lb build 2>&1 | tee build.log
	cd ..
	@scripts/copy-image

.PHONY: PACKET-debug
.ONESHELL:
PACKET-debug: clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	mkdir -p build/config/includes.chroot/etc/cloud/cloud.cfg.d
	cp tools/cloud-init/99-debug-user.chroot build/config/hooks/live/
	cp tools/cloud-init/99-disable-networking.chroot build/config/hooks/live/
	cp tools/cloud-init/PACKET/90_dpkg.cfg build/config/includes.chroot/etc/cloud/cloud.cfg.d/
	cp tools/cloud-init/cloud-init.list.chroot build/config/package-lists/
	cp -f tools/cloud-init/PACKET/config.boot.default-debug build/config/includes.chroot/opt/vyatta/etc/config.boot.default
	cd $(build_dir)
	lb build 2>&1 | tee build.log
	cd ..
	@scripts/copy-image

.PHONY: vep4600
.ONESHELL:
vep4600: check_build_config clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	mkdir -p build/config/includes.chroot/etc/systemd/network
	mkdir -p build/config/includes.chroot/usr/share/initramfs-tools/hooks
	cp tools/dell/90-vep.chroot build/config/hooks/live/
	cp tools/dell/vep4600/*.link build/config/includes.chroot/etc/systemd/network/
	cp tools/dell/vep-hook build/config/includes.chroot/usr/share/initramfs-tools/hooks/
	cd $(build_dir)
	lb build 2>&1 | tee build.log
	cd ..
	@scripts/copy-image

.PHONY: vep1400
.ONESHELL:
vep1400: check_build_config clean prepare
	@set -e
	@echo "It's not like I'm building this specially for you or anything!"
	mkdir -p build/config/includes.chroot/etc/systemd/network
	mkdir -p build/config/includes.chroot/usr/share/initramfs-tools/hooks
	cp tools/dell/90-vep.chroot build/config/hooks/live/
	cp tools/dell/vep1400/*.link build/config/includes.chroot/etc/systemd/network/
	cp tools/dell/vep-hook build/config/includes.chroot/usr/share/initramfs-tools/hooks/
	cd $(build_dir)
	lb build 2>&1 | tee build.log
	cd ..
	@scripts/copy-image

.PHONY: test
.ONESHELL:
test:
	if [ ! -f build/live-image-amd64.hybrid.iso ]; then
		echo "Could not find build/live-image-amd64.hybrid.iso"
		exit 1
	fi
	scripts/check-qemu-install --debug build/live-image-amd64.hybrid.iso

.PHONY: clean
.ONESHELL:
clean:
	@set -e
	cd $(build_dir)
	lb clean

	rm -f config/binary config/bootstrap config/chroot config/common config/source
	rm -f build.log
	rm -f vyos-*.iso
	rm -f *.img
	rm -f *.xz
	rm -f *.vhd
	rm -f *.raw
	rm -f *.tar.gz
	rm -f *.qcow2
	rm -f *.mf
	rm -f *.ovf
	rm -f *.ova
	rm -f *.vmdk

.PHONY: purge
purge:
	rm -rf build/*
