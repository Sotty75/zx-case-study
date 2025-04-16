# ZX Case Study - Z80 Assembly Playground

This repository contains a collection of small programs and experiments written in **Z80 Assembly**, designed for the **ZX Spectrum** platform.

The purpose is to explore low-level programming on retro hardware and experiment with display, logic flow, and memory addressing using modern tools.

---

## Project Structure

```
.
├── build.bat             # Build script
├── *.asm                 # Source files (Z80 assembly)
├── .vscode/              # VSCode tasks and debugger config
├── sna/                  # Output snapshot files (.sna)
├── sld/                  # Symbol/debugging files (.sld)
├── build/                # Build output (ignored)
├── .tmp/                 # Temporary files (ignored)
└── .gitignore            # Git ignore rules
```

---

## Toolchain

This project uses:

- [SJASMPlus](https://github.com/z00m128/sjasmplus) — Z80 assembler
- [Fuse Emulator](http://fuse-emulator.sourceforge.net/) — ZX Spectrum emulator
- [VSCode](https://code.visualstudio.com/) with Z80 extensions and task runner
- (Optional) [ZX-Next tools](https://github.com/tschak909/zx-next-tools) for modern Spectrum variants

> Make sure `sjasmplus` is in your system `PATH` or adjust `build.bat` accordingly.

---

## Build & Run

### To build a program

Run the batch file:

```cmd
build.bat
```

This will assemble the selected `.asm` file(s) and output `.sna` snapshots in the `sna/` folder.

### To run

Open the generated `.sna` file in your favorite ZX Spectrum emulator (e.g. Fuse, Spectaculator, ZXSpin).

---

## Examples

Current experiments include:

- `fill-screen.asm` – Fill screen with a color
- `for-loop.asm` – Demonstrating loop mechanics
- `set-pixel.asm` – Direct pixel manipulation
- `indirizzamento.asm` – Addressing modes
- `if-else.asm` – Conditional logic

---

## Git & Project Notes

- The `sna/` and `sld/` folders are kept in version control, but their contents are ignored to avoid committing large binaries.
- VSCode settings are included to ease debugging and task execution across machines.

---

## Ideas for Expansion

- Input handling via keyboard
- Sprite rendering and animation
- Audio experiments with the AY chip
- Game logic demos (e.g. Pong or Snake)
- Porting simple C routines using z88dk

---

## License

This project is for educational and personal use. Feel free to fork and experiment. No formal license is provided yet.
