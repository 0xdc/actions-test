{
	packageOverrides = pkgs: {
		linux = pkgs.linux.override {
			defconfig = "allnoconfig";
			kernelPatches = [{
				name = "lte-screen-quirk";
				patch = ./10IGL5-LTE_screen_quirk.patch;
			}];
		};
	};
}
