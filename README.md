![image](logo-fall-in-love-with-julia.png)

# fall-in-love-with-julia

[![Binder](https://mybinder.org/badge_logo.svg)](https://notebooks.gesis.org/binder/v2/gh/jolin-io/fall-in-love-with-julia/main)

An introductory 101 series to get to know the power of Julialang.

Author: Stephan Sahm, [Julia User Group Munich](https://www.meetup.com/Julia-User-Group-Munich/).

To open a specific notebook, go to it in github and press the "launch binder" button.
![screenshot](assets/images/Screenshot_20230207_081343.png)


## Why Julia?

**Why was Julia created?**
Definitely read this now impressively old post by Julia founders by Jeff Bezanson, Stefan Karpinski, Viral B. Shah, and Alan Edelman https://julialang.org/blog/2012/02/why-we-created-julia/.

Here my favourite passage

> We want the speed of C with the dynamism of Ruby. We want a language that's homoiconic, with true macros like Lisp, but with obvious, familiar mathematical notation like Matlab. We want something as usable for general programming as Python, as easy for statistics as R, as natural for string processing as Perl, as powerful for linear algebra as Matlab, as good at gluing programs together as the shell. Something that is dirt simple to learn, yet keeps the most serious hackers happy. We want it interactive and we want it compiled.

**Why this needs to be an extra language?** Why cannot Python be made that fast for instance?
Checkout the official compact answer to this in the julia manual F&Q https://docs.julialang.org/en/v1/manual/faq/#Why-don't-you-compile-Matlab/Python/R/%E2%80%A6-code-to-Julia?-1

Here my favourite passage

> Julia's advantage is that good performance is not limited to a small subset of “built-in” types and operations, and one can write high-level type-generic code that works on arbitrary user-defined types while remaining fast and memory-efficient.
> Types in languages like Python simply don't provide enough information to the compiler for similar capabilities, so as soon as you used those languages as a Julia front-end you would be stuck.


## Local installation

If [![Binder](https://mybinder.org/badge_logo.svg)](https://notebooks.gesis.org/binder/v2/gh/jolin-io/fall-in-love-with-julia/main) does not work for you, you can install the package locally. There are two options, using docker, or using plain julia.

### Docker (recommended)

This process is identical to how mybinder.org is actually doing it. Hence you will get the very same environment.

1. Install [docker](https://docs.docker.com/get-docker/)

2. Install [repo2docker](https://repo2docker.readthedocs.io/en/latest/install.html) by running

    ```bash
    python3 -m pip install --user jupyter-repo2docker
    ```

    If you do not have python, consider installing it via [Anaconda](https://www.anaconda.com/products/individual).

3. Execute repo2docker on this repository. It will take several 10 minutes to build everything.

    ```bash
    jupyter-repo2docker https://github.com/jolin-io/fall-in-love-with-julia
    ```

    Usually, a browser is opened automatically for you, but if not, an url is also printed at the very end of the command output. Copy that one to your browser and you are ready to go.

### No docker

This process is installing dependencies tracked by Julia, which will suffice for 98% of the material here.

1. Download and install Julia from https://julialang.org/downloads/

2. Instantiate the fall-in-love-with-julia package

    ```bash
    ProjectFolder="$HOME/JuliaProjects"
    mkdir -p "$ProjectFolder"
    cd "$ProjectFolder"

    git clone https://github.com/jolin-io/fall-in-love-with-julia
    cd fall-in-love-with-julia
    julia --project --eval 'import Pkg; Pkg.instantiate(); Pkg.add("IJulia")'
    ```

3. Run jupyter

    Either use your favorite jupyter installation or run

    ```bash
    ProjectFolder="$HOME/JuliaProjects"
    cd "$ProjectFolder"
    julia --project --eval 'import IJulia; notebook()'
    ```

In case a specific example (e.g. the Streaming Kaggle example) does not work, you may need to install extra packages similar to those described in [apt.txt](./apt.txt) or execute further steps on the commandline similar to those described in [postBuild](./postBuild).