# Java Run (builds then runs a java file)
javar() {
    if [[ -z $1 ]]; then
        echo "Usage: javar <filename.java>"
        return 1
    fi

    local file=$1

    # Remove .java extension if present
    base_name="${file%.java}"

    # Create the dist directory if it doesn't exist
    if [[ ! -d ./dist ]]; then
        mkdir ./dist
    fi

    # Compile the Java file and output class files to dist directory
    javac -d ./dist -h ./dist -s ./dist "$base_name.java"
    if [[ $? -ne 0 ]]; then
        echo "Compilation failed."
        return 1
    fi

    # Properly pass arguments to the Java program
    args=${@: (($#-2)),-1}

    # Run the Java program from the dist directory
    java -cp ./dist "$base_name" $args
}
