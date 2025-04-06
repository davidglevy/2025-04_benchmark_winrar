import sys
import subprocess
import time

def run_benchmark():
    if len(sys.argv) < 2:
        print("You must specify a file argument")
        sys.exit(1)

    args = sys.argv[1:]

    file_arg = args[-1]
    print(f"Running benchmark on [{file_arg}]")

    # TODO Add user temp folder creation for destination.

    start = time.time()
    subprocess.check_output(['winrar', 'x', '-o+', file_arg, '*.*'])
    end = time.time()

    winrar_duration = end - start
    print(f"WinRAR duration to extract was [{winrar_duration}]")

    start = time.time()
    powershell_cmd = f"Expand-Archive -Force '{file_arg}' '%~dp0'"
    subprocess.check_output(['powershell', '-command', powershell_cmd])
    end = time.time()

    windows_ext_duration = end - start
    print(f"Windows native duration to extract was [{windows_ext_duration}]")



if __name__ == "__main__":
    run_benchmark()