#include "git_api.h"

namespace godot {

void GitAPI::_register_methods() {

    register_method("_process", &GitAPI::_process);
	register_method("get_vcs_name", &GitAPI::get_vcs_name);

	godot::register_signal<GitAPI>("get_vcs_name", godot::Dictionary());
}

GitAPI::GitAPI() {
	godot::Godot::print("Gitinit!");
	connect("get_vcs_name", (EditorVCSInterface *) this, "get_vcs_name");
}

GitAPI::~GitAPI() {
}

void GitAPI::_init() {

}

String GitAPI::get_vcs_name() {

	return "Git";
}

void GitAPI::_process(float delta) {
}

}