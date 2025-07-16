# Contributing to Kelexine Labs

## Package Submission Guidelines

1. **Build your package** following Termux conventions
2. **Test thoroughly** in a clean Termux environment  
3. **Submit a pull request** with your package in the `pool/` directory
4. **Include documentation** for your package's usage

## Package Requirements

- Must be compatible with Termux environment
- Follow standard Debian package naming: `package-name_version_architecture.deb`
- Include proper control file with dependencies
- No malicious or harmful code

## Building Packages

Use the provided build script:
```bash
./build-package.sh my-tool 1.0.0 aarch64
```

Then add your files to the generated build directory and build with:
```bash
dpkg-deb --build build-my-tool my-tool_1.0.0_aarch64.deb
mv my-tool_1.0.0_aarch64.deb pool/
```
