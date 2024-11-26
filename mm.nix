{
	packageOverrides = pkgs: {
		modemmanager = (pkgs.modemmanager.overrideAttrs (attrs: {
			pname = attrs.pname + "-xmm7360";
			src = attrs.src.override {
				owner = "tuxor1337";
				rev = "intel-rpc-xmm7360";
				hash = "sha256-cXaI1ZuS6y90ZOeiqh7oq/+gvuoKi5MmMiCntgl0rbo=";
			};
			patches = [
				./modemmanager/no-dummy-dirs-in-sysconfdir.patch
			];
		})).override {
			# Needs dev version of libmbim
			libmbim = pkgs.libmbim.overrideAttrs (attrs: {
			version = "1.31.5";
				src = attrs.src.override {
					rev = "1.31.5-dev";
					hash = "sha256-Brut0PobAc6rTbGAo4NTauzHtwJrZOJjEw26hyXqA5w=";
				};
			});

			# Needs dev version of libqmi
			libqmi = pkgs.libqmi.overrideAttrs (attrs: {
				version = "1.35.6";
				src = attrs.src.override {
					rev = "1.35.6-dev";
					hash = "sha256-kw2i9NVYJTcFbgcuZ8GNS0wt/ZgcomeAP/KWXXAV8Xk=";
				};
			});
		};
	}
}
