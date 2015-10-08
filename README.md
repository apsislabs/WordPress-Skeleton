# WordPress Skeleton

This is a fork of Mark Jaquith's WordPress Skeleton. We've modified it for use with a simple LAMP Vagrant box running Ubuntu 14.04 LTS.

## Getting up and Running

1. `sh bin/bootstrap.sh`
2. `vagrant up`
3. Visit `localhost:8080`
4. Rejoice

## Deployment

When deploying, you'll need to create and update the values in `config/remote-config.php`, a template for which can be found at `config/remote-config-sample.php`.

Whatever your deploy process, it will need to have the ability to check out the WordPress submodule. Capistrano does this nicely.

## Assumptions

- WordPress as a Git submodule in `/wp/`
- Custom content directory in `/content/` (cleaner, and also because it can't be in `/wp/`)
- `wp-config.php` in the root (because it can't be in `/wp/`)
- All writable directories are symlinked to similarly named locations under `/shared/`.

## Questions & Answers

**Q:** Why the `/shared/` symlink stuff for uploads?  
**A:** For local development, create `/shared/` (it is ignored by Git), and have the files live there. For production, have your deploy script (Capistrano is my choice) look for symlinks pointing to `/shared/` and repoint them to some outside-the-repo location (like an NFS shared directory or something). This gives you separation between Git-managed code and uploaded files.

**Q:** What version of WordPress does this track?  
**A:** The latest stable release. Send a pull request if I fall behind.

**Q:** What's the deal with `config/local-config.php`?  
**A:** It is for local development, which might have different MySQL credentials or do things like enable query saving or debug mode. This file is ignored by Git, so it doesn't accidentally get checked in. If the file does not exist (which it shouldn't, in production), then WordPress will used the DB credentials defined in `config/remote-config.php`.

**Q:** What is `memcached.php`?  
**A:** This is for people using memcached as an object cache backend. It should be something like: `<?php return array( "server01:11211", "server02:11211" ); ?>`. Programattic generation of this file is recommended. The included Vagrantfile does not use memcache.
