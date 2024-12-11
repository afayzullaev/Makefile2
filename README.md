# Makefile Tutorial

This tutorial walks you through setting up and using a simple Makefile for a C project. Makefiles are powerful tools that help automate the build process, manage dependencies, and organize output files.

## Project Structure

```
Project/
├── build/          # Directory for build outputs
├── main.c          # Main source file
├── main.h          # Header file
├── Makefile        # Build script
```

### File Descriptions

- **`main.c`**: Contains the implementation of your program.
- **`main.h`**: Declares functions or macros used in `main.c`.
- **`Makefile`**: Automates the compilation and linking process.
- **`build/`**: Stores object files and the final executable.

## Step-by-Step Guide

### 1. Setting Up the Makefile

A Makefile uses rules to specify how to compile and link your code. Below is an example Makefile used for this project:

```make
.PHONY: all clean

CC := gcc
CFLAGS :=

BUILD_DIR := build
$(shell mkdir -p $(BUILD_DIR))

SRC := main.c
OBJ := $(BUILD_DIR)/main.o
HEADER := main.h

all: $(BUILD_DIR)/executable
	@echo "Build Complete!"

$(BUILD_DIR)/%.o: %.c $(HEADER)
	$(CC) $(CFLAGS) -I./ -c $< -o $@

$(BUILD_DIR)/executable: $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -rf build/
```

### 2. Understanding the Makefile

#### Variables

- `CC`: Specifies the compiler (default: `gcc`).
- `CFLAGS`: Compiler flags (can be customized as needed).
- `BUILD_DIR`: The directory where compiled files are stored.
- `SRC`: The source file(s) to compile.
- `OBJ`: The resulting object file(s).
- `HEADER`: Header file(s) included in the source file(s).

#### Targets

1. **`all`**: Builds the project by creating an executable.
   ```make
   all: $(BUILD_DIR)/executable
   ```

2. **`$(BUILD_DIR)/%.o`**: Compiles a `.c` file into an `.o` (object) file.
   ```make
   $(BUILD_DIR)/%.o: %.c $(HEADER)
   	$(CC) $(CFLAGS) -I./ -c $< -o $@
   ```

3. **`$(BUILD_DIR)/executable`**: Links object files to create the final executable.
   ```make
   $(BUILD_DIR)/executable: $(OBJ)
   	$(CC) $(CFLAGS) $^ -o $@
   ```

4. **`clean`**: Removes the build directory and its contents.
   ```make
   clean:
   	rm -rf build/
   ```

### 3. Building the Project

Run the `make` command in the terminal to build your project:
```bash
make
```
This will:
1. Create the `build/` directory (if it doesn’t already exist).
2. Compile `main.c` into `main.o`.
3. Link `main.o` to produce the executable in the `build/` directory.

### 4. Running the Executable

After building, you can run the program:
```bash
./build/executable
```

### 5. Cleaning Up

To remove build artifacts, run:
```bash
make clean
```
This deletes the `build/` directory and its contents.

## Additional Tips

- To customize the compiler or flags, modify the `CC` and `CFLAGS` variables in the Makefile.
- For projects with multiple source files, add them to the `SRC` variable and adjust `OBJ` accordingly.
- Use `@echo` commands in the Makefile to provide feedback during the build process.

## Example Output

After running `make`, you should see:
```
gcc -I./ -c main.c -o build/main.o
gcc build/main.o -o build/executable
Build Complete!
```

Running the executable should produce your program’s output.

## Why Use Makefiles?

- **Automation**: Reduces manual steps in building projects.
- **Reusability**: Easily adaptable for different projects.
- **Efficiency**: Compiles only updated files, saving time.

## Conclusion

This tutorial demonstrates the basics of using a Makefile for a simple C project. As your projects grow, you can extend the Makefile to handle additional complexities like libraries, multiple source files, and advanced flags.
