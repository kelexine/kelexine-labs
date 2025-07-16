#!/bin/bash
# Kelexine Labs - Repository Setup Script

set -e

echo "🚀 Setting up Kelexine Labs repository structure..."

# Create directory structure
mkdir -p pool
mkdir -p .github/workflows
mkdir -p docs

# Create initial pool directory with .gitkeep
touch pool/.gitkeep

# Create a simple example package for testing
echo "📦 Creating example package..."
./build-package.sh example-tool 1.0.0 aarch64

# Add example binary to the package
mkdir -p "build-example-tool/data/data/com.termux/files/usr/bin"
cat > "build-example-tool/data/data/com.termux/files/usr/bin/example-tool" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
echo "Hello from Kelexine Labs Example Tool!"
echo "This is a demonstration package."
echo "Visit: https://kelexine.github.io/kelexine-labs"
EOF

chmod +x "build-example-tool/data/data/com.termux/files/usr/bin/example-tool"

# Add documentation
mkdir -p "build-example-tool/data/data/com.termux/files/usr/share/doc/example-tool"
cat > "build-example-tool/data/data/com.termux/files/usr/share/doc/example-tool/README" << 'EOF'
Example Tool v1.0.0
===================

This is a demonstration package for Kelexine Labs.

Usage:
    example-tool

For more information, visit:
https://kelexine.github.io/kelexine-labs
EOF

# Build the example package
echo "🔨 Building example package..."
dpkg-deb --build build-example-tool example-tool_1.0.0_aarch64.deb
mv example-tool_1.0.0_aarch64.deb pool/

# Clean up build directory
rm -rf build-example-tool

# Create GitHub Pages configuration
echo "📄 Creating GitHub Pages configuration..."
cat > docs/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kelexine Labs - Termux Repository</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 800px; margin: 0 auto; padding: 20px; }
        .code { background: #f4f4f4; padding: 10px; border-radius: 5px; font-family: monospace; }
        .header { text-align: center; margin-bottom: 40px; }
        .section { margin-bottom: 30px; }
    </style>
</head>
<body>
    <div class="header">
        <h1>🧪 Kelexine Labs</h1>
        <p>Custom Termux Package Repository</p>
    </div>
    
    <div class="section">
        <h2>Quick Setup</h2>
        <div class="code">
echo "deb https://kelexine.github.io/kelexine-labs kelexine main" > $PREFIX/etc/apt/sources.list.d/kelexine-labs.list<br>
pkg update<br>
pkg install example-tool
        </div>
    </div>
    
    <div class="section">
        <h2>Available Packages</h2>
        <ul>
            <li><strong>example-tool</strong> - Demonstration package</li>
        </ul>
    </div>
    
    <div class="section">
        <h2>Repository</h2>
        <p>Visit our <a href="https://github.com/kelexine/kelexine-labs">GitHub repository</a> for more information.</p>
    </div>
</body>
</html>
EOF

# Create basic gitignore
cat > .gitignore << 'EOF'
# Build artifacts
build-*/
*.deb.tmp
*.buildinfo
*.changes

# System files
.DS_Store
Thumbs.db

# IDE files
.vscode/
.idea/
*.swp
*.swo

# Logs
*.log
EOF

# Create contributing guidelines
cat > CONTRIBUTING.md << 'EOF'
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
EOF

# Create license file
cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2024 Kelexine Labs

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

echo "✅ Repository setup complete!"
echo ""
echo "Next steps:"
echo "1. Copy build-repo.yml to .github/workflows/"
echo "2. Enable GitHub Pages in repository settings"
echo "3. Add GPG keys to repository secrets (optional)"
echo "4. Push to GitHub to trigger first build"
echo ""
echo "Repository will be available at:"
echo "https://YOUR_USERNAME.github.io/kelexine-labs"
