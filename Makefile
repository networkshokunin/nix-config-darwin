up:
	nix flake update

# remove all generations older than 7 days
clean:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

# Garbage collect all unused nix store entries
gc:
	# garbage collect all unused nix store entries
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 3d
	sudo nix-collect-garbage --delete-older-than 3d
	nix-collect-garbage --delete-older-than 3d

build:
	sudo darwin-rebuild switch --flake .#david-mbp14
	sudo ./result/sw/bin/darwin-rebuild switch --flake .#david-mbp14
