# C-Run, builds and runs a C file
crun() {
    if [[ -z $1 ]]; then
        echo "Usage: crun <filename.c>"
        return 1
    fi

    local file=$1

    # Remove .c extension if present
    base_name="${file%.c}"

    # Create the dist directory if it doesn't exist
    if [[ ! -d ./dist ]]; then
        mkdir ./dist
    fi

    # Compile the C file and output object files to dist directory
    gcc -o ./dist/$base_name "$base_name.c" -lm
    if [[ $? -ne 0 ]]; then
        echo "Compilation failed."
        return 1
    fi

    # Run the C program from the dist directory
    chmod +x ./dist/$base_name
    ./dist/$base_name
}
