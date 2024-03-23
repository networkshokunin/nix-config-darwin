deploy:
	nix build .#darwinConfigurations.david-mbp14.system \
	   --extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#david-mbp14
