# Kelexine Labs - Custom Termux Package Repository

> **Innovation in mobile development** - Your go-to repository for custom Termux packages and experimental tools.

## 🚀 Quick Start

Add Kelexine Labs to your Termux environment:

```bash
# Add the repository
echo "deb https://kelexine.github.io/kelexine-labs kelexine main" > $PREFIX/etc/apt/sources.list.d/kelexine-labs.list

# Update package lists
pkg update

# Install packages
pkg install <package-name>
```

## 📦 Available Packages

### Main Repository (Stable)

| Package | Version | Description | Architecture |
|---------|---------|-------------|--------------|
| `example-tool` | v1.0.0 | Example package description | aarch64 |
| `another-utility` | v2.1.0 | Another tool for demonstration | aarch64 |

### Experimental (Beta)

| Package | Version | Description | Architecture |
|---------|---------|-------------|--------------|
| `experimental-app` | v0.9.0 | Cutting-edge experimental tool | aarch64 |

## 🔧 Repository Information

- **Repository URL:** `https://kelexine.github.io/kelexine-labs`
- **Distribution:** `kelexine`
- **Components:** `main`, `experimental`
- **Architectures:** `aarch64` (primary), `arm` (legacy)

## 📋 Installation Examples

```bash
# Install a specific package
pkg install example-tool

# Search for packages
pkg search kelexine

# List installed packages from this repo
pkg list-installed | grep kelexine
```

## 🏗️ Repository Structure

```
kelexine-labs/
├── dists/kelexine/main/binary-aarch64/  # Main stable packages
├── dists/kelexine/experimental/         # Beta/experimental packages
├── pool/                                # Source .deb files
├── Packages.gz                          # Package index
├── Release                              # Repository metadata
└── InRelease                            # GPG signed release
```

## 🔒 Security & Verification

This repository is automatically built and signed using GitHub Actions. All packages are:
- Built in controlled environments
- Automatically scanned for common issues
- Signed with GPG keys for integrity verification

## 📝 Package Submission Guidelines

Interested in contributing a package? Here's how:

1. **Build your .deb package** following Termux conventions
2. **Test thoroughly** in a clean Termux environment
3. **Submit a pull request** with your package in the `pool/` directory
4. **Include documentation** for your package's usage

### Package Requirements

- Must be compatible with Termux environment
- Follow standard Debian package naming: `package-name_version_architecture.deb`
- Include proper control file with dependencies
- No malicious or harmful code

## 🐛 Issues & Support

- **Bug Reports:** [GitHub Issues](https://github.com/kelexine/kelexine-labs/issues)
- **Feature Requests:** [GitHub Discussions](https://github.com/kelexine/kelexine-labs/discussions)
- **Package Requests:** Create an issue with the `package-request` label

## 📈 Repository Stats

- **Total Packages:** 2
- **Last Updated:** Auto-updated via GitHub Actions
- **Update Frequency:** On-demand (when packages are added/updated)

## 🤝 Contributing

We welcome contributions! Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting.

## 📄 License

This repository and its automation scripts are licensed under the MIT License. Individual packages may have their own licenses - check each package's documentation.

## 🔗 Related Projects

- [Termux](https://termux.com/) - The terminal emulator that makes this possible
- [termux-apt-repo](https://github.com/termux/termux-apt-repo) - The tool that powers our repository generation

---

**Made with ❤️ by Kelexine Labs**
