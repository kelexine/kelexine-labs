#!/bin/bash
# Kelexine Labs - Package Builder Script
# Usage: ./build-package.sh <package-name> <version> [architecture]

set -e

PACKAGE_NAME="$1"
VERSION="$2"
ARCH="${3:-aarch64}"
MAINTAINER="Kelexine Labs <labs@kelexine.com>"

if [ -z "$PACKAGE_NAME" ] || [ -z "$VERSION" ]; then
    echo "Usage: $0 <package-name> <version> [architecture]"
    echo "Example: $0 my-tool 1.0.0 aarch64"
    exit 1
fi

BUILD_DIR="build-${PACKAGE_NAME}"
CONTROL_FILE="${BUILD_DIR}/DEBIAN/control"
PACKAGE_FILE="${PACKAGE_NAME}_${VERSION}_${ARCH}.deb"

echo "🏗️  Building package: ${PACKAGE_NAME} v${VERSION} (${ARCH})"

# Create build directory structure
mkdir -p "${BUILD_DIR}/DEBIAN"
mkdir -p "${BUILD_DIR}/data/data/com.termux/files/usr/bin"
mkdir -p "${BUILD_DIR}/data/data/com.termux/files/usr/share/doc/${PACKAGE_NAME}"

# Create control file
cat > "${CONTROL_FILE}" << EOF
Package: ${PACKAGE_NAME}
Version: ${VERSION}
Architecture: ${ARCH}
Maintainer: ${MAINTAINER}
Depends: termux-tools
Section: utils
Priority: optional
Homepage: https://kelexine.github.io/kelexine-labs
Description: Custom Termux package by Kelexine Labs
 This package provides ${PACKAGE_NAME} for Termux environments.
 Built and maintained by Kelexine Labs.
EOF

# Create postinst script (optional)
cat > "${BUILD_DIR}/DEBIAN/postinst" << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
set -e

echo "✅ Package installation completed successfully!"
echo "Run '$(basename "$0")' to get started."
EOF

chmod +x "${BUILD_DIR}/DEBIAN/postinst"

# Create prerm script (optional)
cat > "${BUILD_DIR}/DEBIAN/prerm" << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
set -e

echo "🗑️  Removing package..."
EOF

chmod +x "${BUILD_DIR}/DEBIAN/prerm"

echo "📝 Package structure created in ${BUILD_DIR}/"
echo "📂 Add your files to:"
echo "   - Binaries: ${BUILD_DIR}/data/data/com.termux/files/usr/bin/"
echo "   - Documentation: ${BUILD_DIR}/data/data/com.termux/files/usr/share/doc/${PACKAGE_NAME}/"
echo "   - Libraries: ${BUILD_DIR}/data/data/com.termux/files/usr/lib/"

echo ""
echo "🔨 After adding your files, run:"
echo "   dpkg-deb --build ${BUILD_DIR} ${PACKAGE_FILE}"
echo "   mv ${PACKAGE_FILE} pool/"
echo "   git add pool/${PACKAGE_FILE}"
echo "   git commit -m 'Add ${PACKAGE_NAME} v${VERSION}'"
echo "   git push"

echo ""
echo "🎯 Package will be available as: pkg install ${PACKAGE_NAME}"
