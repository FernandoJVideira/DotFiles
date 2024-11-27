case $package_manager in
        "brew")
            brew install go
            ;;
        "apt")
            sudo apt install golang-go
            ;;
        "pacman")
            sudo pacman -S go
            ;;
        "dnf")
            sudo dnf install golang
            ;;
        *)
            echo "Unknown package manager"
            exit 1
            ;;
    esac