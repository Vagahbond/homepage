{
  lib,
  pkgs,
  config,
}: {
  users.users.homepage = {
    home = "${cfg.home}";
    group = "nextcloud";
    isSystemUser = true;
  };
  users.groups.nextcloud.members = [
    "nextcloud"
    config.services.nginx.user
  ];
}
