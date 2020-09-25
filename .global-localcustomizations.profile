#!/usr/bin/zsh

export pre_zshProfile() {
	if [ -f "${HOME}/bin/.custom/pre-zsh.profile" ] ; then
		source "${HOME}/bin/.custom/pre-zsh.profile";
	fi
}

export post_zshProfile() {
	if [ -f "${HOME}/bin/.custom/post.profile" ] ; then
		source "${HOME}/bin/.custom/post.profile";
	fi
}

