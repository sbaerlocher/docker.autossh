# Container: Autossh

[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=popout-square)](licence)

## Description

Highly customizable AutoSSH docker container.

## Environment Variables

### SSH_HOSTUSER

**Default**: `root`

Specify the usename on the remote endpoint.

### SSH_TUNNEL_HOST

**Required** Tunnel Host

Specify the address (ip preferred) of the target.

### SSH_REMOTE_HOST

**Default**: `localhost`

Specify the address (ip preferred) of the remote endpoint. (Default: localhost)

### SSH_LOCAL_PORT

**Required** Local Port

Specify the port number on the target endpoint which will serve as the tunnel exit, or destination service. Typically this is ssh (port: 22), however, you can tunnel other services such as redis (port: 6379), elasticsearch (port: 9200) or good old http (port: 80) and https (port: 443).

### SSH_REMOTE_PORT

**Required** Remote Port

Specify the port number on the remote endpoint which will serve as the tunnel entrance. (Default: random > 32768) If you do not want a new port every time you restart jnovack/autossh you may wish to explicitly set this.

This option reverses if you set SSH_MODE (see below). To bind a local forward tunnel to all interfaces, use an asterisk then the port desigation (e.g. \*:2222).

#### SSH_MODE

**Default**: `-L`

Defines how the tunnel will be set up:

- `-R` is default, remote forward mode
- `-L` means local forward mode

### DEBUG_MODE

**Default**: `-v`

causes autossh to display its version number and exit.

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://sbaerlocher.ch"><img src="https://avatars1.githubusercontent.com/u/4160387?v=4" width="100px;" alt=""/><br /><sub><b>Simon Baerlocher</b></sub></a><br /><a href="https://github.com/sbaerlocher/docker.autossh/commits?author=sbaerlocher" title="Code">💻</a> <a href="#ideas-sbaerlocher" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/sbaerlocher/docker.autossh/commits?author=sbaerlocher" title="Documentation">📖</a></td>
  </tr>
</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

## License

<!-- markdownlint-disable -->

This project is under the MIT License. See the [LICENSE](licence) file for the full license text.

<!-- markdownlint-enable -->

## Copyright

(c) 2020, sbaerlocher
