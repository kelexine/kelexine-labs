# Kelexine Labs - Custom Termux Package Repository

![Kelexine Labs Banner](https://raw.githubusercontent.com/kelexine/kelexine-labs/main/docs/banner.png)

Welcome to **Kelexine Labs**, the official `apt` repository for custom-built Termux packages and compiled binaries by Kelexine. This repository provides unique tools and experimental projects to enhance your Termux environment.

---

## 🚀 One-Line Installation

To get started quickly, run this command in your Termux terminal. It will automatically add the repository and its GPG key.

```bash
curl -sL https://raw.githubusercontent.com/kelexine/kelexine-labs/main/install-repo.sh | bash
```

After running the script, you can immediately start installing packages.

---

## 📦 Available Packages

Here is a list of packages currently available in the repository:

| Package         | Version | Description                                                                 |
|-----------------|---------|-----------------------------------------------------------------------------|
| `example-tool`  | 1.0.0   | A demonstration package to verify repository functionality.                 |
| `termux-info`   | 1.0.0   | A powerful tool to display a comprehensive summary of your Termux environment. |

### Example Usage

```bash
# Install the termux-info package
pkg install termux-info

# Run the tool
termux-info
```

---

## 🛠️ Manual Installation

If you prefer to add the repository manually, follow these steps:

1.  **Add the GPG Key:**

    ```bash
    pkg install gnupg curl -y
    curl -sL https://raw.githubusercontent.com/kelexine/kelexine-labs/main/gpg_public_key.asc | gpg --dearmor > $PREFIX/etc/apt/trusted.gpg.d/kelexine-labs.gpg
    ```

2.  **Add the Repository to Sources:**

    ```bash
    echo "deb [signed-by=$PREFIX/etc/apt/trusted.gpg.d/kelexine-labs.gpg] https://kelexine.github.io/kelexine-labs kelexine main" > $PREFIX/etc/apt/sources.list.d/kelexine-labs.list
    ```

3.  **Update and Install:**

    ```bash
    pkg update
    pkg install <package-name>
    ```

---

## 🤝 Contributing

Contributions are welcome! If you have a package you'd like to add, please follow the guidelines in [CONTRIBUTING.md](CONTRIBUTING.md).

1.  **Build your package** following Termux conventions.
2.  **Test it thoroughly** in a clean Termux environment.
3.  **Submit a pull request** with your `.deb` package in the `pool/` directory.

---

## 📜 License

This repository and its contents are licensed under the [MIT License](LICENSE).