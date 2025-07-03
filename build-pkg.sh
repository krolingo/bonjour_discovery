#!/usr/bin/env bash
set -euo pipefail

echo "🔹 Cleaning previous builds..."
rm -rf build dist
rm -rf package-root/*
mkdir -p package-root

echo "🔹 Building app with py2app..."
python3 setup.py py2app

echo "🔹 Copying built app to package root..."
cp -R dist/*.app package-root/

echo "🔹 Ensuring postinstall script is executable..."
chmod +x installer-scripts/postinstall

echo "🔹 Creating installer package..."
pkgbuild \
  --root package-root \
  --install-location / \
  --scripts installer-scripts \
  --identifier com.example.bonjourdiscovery \
  --version 1.0.0 \
  BonjourDiscoveryInstaller.pkg

echo "✅ Installer package 'BonjourDiscoveryInstaller.pkg' created successfully."