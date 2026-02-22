# Update Script

```
  cd ~/src/homebrew-tap
  git checkout main
  git pull --ff-only

  gh release download v0.1.3 -D Formula -R farmerchris/butt -p '*.rb' -p '*homebrew*' -p '*formula*' --clobber
  git diff
```

Add test if needed:

```
  test do
    assert_match version.to_s, shell_output("#{bin}/butt --version")
  end
```

Commit

```
  brew style Formula/butt.rb --fix
  git add .
  git commit -m "butt 0.1.3"
```

Test

```
  brew uninstall farmerchris/tap/butt || true
  brew untap farmerchris/tap || true
  brew tap farmerchris/tap-local "file://$PWD"
  brew audit --strict --online farmerchris/tap/butt
  HOMEBREW_NO_AUTO_UPDATE=1 brew reinstall --build-from-source farmerchris/tap/butt
  brew test farmerchris/tap/butt
  brew uninstall farmerchris/tap/butt
```

Push

```
  git push origin main
```

Test

```
  brew untap farmerchris/tap
  brew tap farmerchris/tap
  brew reinstall butt
```