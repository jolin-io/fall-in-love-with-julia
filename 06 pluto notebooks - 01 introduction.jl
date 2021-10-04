### A Pluto.jl notebook ###
# v0.16.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 5e970055-1076-4841-9d2b-ec75e7142a41
using PlutoUI

# ╔═╡ db2292c8-d3f0-459c-b478-1e95ccab863c
begin
	using HypertextLiteral: JavaScript
	
	_transfer_data(data) = if isdefined(Main, :PlutoRunner) && isdefined(Main.PlutoRunner, :publish_to_js)
		# faster data transfer using MsgPack if available
		JavaScript(Main.PlutoRunner.publish_to_js(data))
	else
		data
	end
end

# ╔═╡ 3ffae4f4-ee7d-4207-a37c-f759292be96e
using CommonMark

# ╔═╡ f644142d-4146-43c0-8049-fb345282b31a
using HypertextLiteral

# ╔═╡ 77efb520-f7d4-44ad-8e8c-f649fb6953a8
md"""
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/schlichtanders/fall-in-love-with-julia/master?
urlpath=pluto/open?path=/home/jovyan/06%20pluto%20notebooks%20-%2001%20introduction.jl)
"""

# ╔═╡ 227285cb-0f4a-47ba-9037-143307d6f691
cm"""
# Welcome to Pluto.jl!

How can you use this notebook? 🔎 For a summary see [this wiki entry](https://github.com/fonsp/Pluto.jl/wiki/%F0%9F%94%8E-Basic-Commands-in-Pluto.)
"""

# ╔═╡ 67dcf398-fc6a-4963-a390-d3dcfc69ea8d
"the " * "result" * " appears on the top ↑↑↑"

# ╔═╡ a6741b19-d378-4279-a1e4-70c18eb20cb5
x = 10 # definitions create dependencies

# ╔═╡ 415fd393-eca0-4630-9be5-8a8265560b0d
y = x * x  # try changing `a` and see what happens

# ╔═╡ f31bc6f0-4fd6-444f-89df-8680deea986d
sin(y)  # open the Live docs on the right, then click onto `sin`

# ╔═╡ 11c03bd1-8752-4b9d-a3c5-203fb7a5872f
cm"""Task: drag and drop the cells above to change their order"""

# ╔═╡ d055e80b-6efb-4f78-9506-a886139598d9
cm"""## Caution with Mutation"""

# ╔═╡ 7fce21a5-9e97-44ce-b76a-5711fb62cd3b
cm""" only mutate/change variables in the very cell it was defined """

# ╔═╡ 68701cb6-71e9-4853-a8e8-7cbcaaaf234b
n_yesterday = 0

# ╔═╡ b4d2b9a0-a4a5-4c14-9092-93b0570628dd
begin
    n_today = n_yesterday
    n_today += 3
    n_today *= 2
end

# ╔═╡ cc8c129e-c955-414c-a415-a1879152a007
m_yesterday = Ref(0)

# ╔═╡ 618a2046-573e-4d44-9dba-5800951994cd
m_yesterday[] += 3

# ╔═╡ 2e4084dd-acf1-4350-95b3-f0e77cb28953
m_yesterday[] *= 2

# ╔═╡ 3c029c7f-752f-4c99-b465-2c19675d1732
cm"""# Interactivity"""

# ╔═╡ 788c2f4b-1679-4b2b-adc7-21f26e0fd277
cm"""
## Simple Interactivity
"""

# ╔═╡ 506ddcb3-c9eb-4e23-8a01-040b4103487e
cm"""
fix the following definition so that `z = 2x + y` 
"""

# ╔═╡ c367af42-71ef-4401-93bd-d2ade01606f5
z = 3

# ╔═╡ 8ea36f83-4110-4505-b2e4-8a29c68f5560
cm"""## `@bind` Interactivity

Pluto comes with `@bind` which enables you to link html input elements to julia variables.
"""

# ╔═╡ 306f0d0a-5151-4ea6-9eb2-1a7d700118f2
@bind yourrange html"<input type=range >"

# ╔═╡ b103e55f-0d03-404c-a574-f116cf878ab6
yourrange

# ╔═╡ 4ad1bae8-ba32-4060-b06a-a1e109cd06fa
cm"""
`a = ` $(@bind a html"<input type=range >")

`b = ` $(@bind b html"<input type=text >")

`c = ` $(@bind c html"<input type=button value='Click'>")

`d = ` $(@bind d html"<input type=checkbox >")

`e = ` $(@bind e html"<select><option value='one'>First</option><option value='two'>Second</option></select>")

`f = ` $(@bind f html"<input type=color >")

"""

# ╔═╡ 053a6e13-cfa7-431e-84cf-0839c8250f97
(a, b, c, d, e, f)

# ╔═╡ 780677dd-cf4c-46f8-b9dc-37a12a288242
cm"""
## PlutoUI

PlutoUI gives you a couple of useful helper functions.
"""

# ╔═╡ addf17dd-be2f-4cdc-952d-115061506532
@bind yourslider Slider(1:10, default=3, show_value=true)

# ╔═╡ 7f1fc43b-3f40-4d5b-ba2b-71916ff9b436
yourslider

# ╔═╡ 42e94190-dbae-46d3-9257-bf3318f65b9d
md"""comment and uncomment the following line"""

# ╔═╡ cdf7ba93-ec68-4f36-a650-def062ba61f4
TableOfContents()

# ╔═╡ 227c49cb-e986-45a6-89be-5558fcf3dba1
cm"""**Explore many more PlutoUI objects:**

1. copy the url `https://raw.githubusercontent.com/fonsp/Pluto.jl/main/sample/PlutoUI.jl.jl`
2. Press and hold CTRL key and click on the Pluto logo at the very top
3. In the Pluto main window paste the url in the textfield "open from file"
"""

# ╔═╡ 59fd9fa6-23a0-4ca5-97ce-091c5c74268d
md"""
## Custom JavaScript
"""

# ╔═╡ c7c8c86d-2de2-4862-9899-e63b78d24d29
@bind dims htl"""
<canvas width="200" height="200" style="position: relative"></canvas>

<script>
// 🐸 `currentScript` is the current script tag - we use it to select elements 🐸 //
const canvas = currentScript.parentElement.querySelector("canvas")
const ctx = canvas.getContext("2d")

var startX = 80
var startY = 40

function onmove(e){
	// 🐸 We send the value back to Julia 🐸 //
	canvas.value = [e.layerX - startX, e.layerY - startY]
	canvas.dispatchEvent(new CustomEvent("input"))

	ctx.fillStyle = '#ffecec'
	ctx.fillRect(0, 0, 200, 200)
	ctx.fillStyle = '#3f3d6d'
	ctx.fillRect(startX, startY, ...canvas.value)
}

canvas.onpointerdown = e => {
	startX = e.layerX
	startY = e.layerY
	canvas.onpointermove = onmove
}

canvas.onpointerup = e => {
	canvas.onpointermove = null
}

// Fire a fake pointermoveevent to show something
onmove({layerX: 130, layerY: 160})

</script>
"""

# ╔═╡ e458f2cc-cd31-4e32-83c1-3cfec6b89a6e
dims

# ╔═╡ 37415d7a-4737-46ac-9f16-44d81ccc8793
begin
	ClickCounter(text="Click") = @htl("""
	<div>
	<button>$(text)</button>
	
	<script>
	
		// Select elements relative to `currentScript`
		var div = currentScript.parentElement
		var button = div.querySelector("button")
	
		// we wrapped the button in a `div` to hide its default behaviour from Pluto
	
		var count = 0
	
		button.addEventListener("click", (e) => {
			count += 1
	
			// we dispatch the input event on the div, not the button, because 
			// Pluto's `@bind` mechanism listens for events on the **first element** in the
			// HTML output. In our case, that's the div.
	
			div.value = count
			div.dispatchEvent(new CustomEvent("input"))
			e.preventDefault()
		})
	
		// Set the initial value
		div.value = count
	
	</script>
	</div>
	""")
	
	@bind num_clicks ClickCounter("Click me")
end

# ╔═╡ 177bf468-c5f4-4b01-87c0-97a56f1e3109
num_clicks

# ╔═╡ 73840820-f592-4682-a3d4-de500c0669ae
cm"""**Advanced:** Transfer data from julia to javascript without copying."""

# ╔═╡ 93a0f206-77f0-4563-bfda-39b6571c39e8
my_data = (startX = 10, startY = 20)

# ╔═╡ 37c9fae8-0982-4026-83ac-0f913188a2bd
@bind dims_my_data htl"""
<canvas width="200" height="200" style="position: relative"></canvas>

<script>
// 🐸 `currentScript` is the current script tag - we use it to select elements 🐸 //
const canvas = currentScript.parentElement.querySelector("canvas")
const ctx = canvas.getContext("2d")

// interpolate the data 🐸
const data = $(_transfer_data(my_data))
var startX = data.startX
var startY = data.startY

function onmove(e){
	// 🐸 We send the value back to Julia 🐸 //
	canvas.value = [e.layerX - startX, e.layerY - startY]
	canvas.dispatchEvent(new CustomEvent("input"))

	ctx.fillStyle = '#ffecec'
	ctx.fillRect(0, 0, 200, 200)
	ctx.fillStyle = '#3f3d6d'
	ctx.fillRect(startX, startY, ...canvas.value)
}

canvas.onpointerdown = e => {
	startX = e.layerX
	startY = e.layerY
	canvas.onpointermove = onmove
}

canvas.onpointerup = e => {
	canvas.onpointermove = null
}

// Fire a fake pointermoveevent to show something
onmove({layerX: 130, layerY: 160})

</script>
"""

# ╔═╡ 40a43215-70b0-4d10-aee6-ddc7a4ce1257
dims_my_data

# ╔═╡ 9d7c3d14-e0e5-43bc-99e7-81774bf325fe
cm"""# Markdown and HTML"""

# ╔═╡ 354694a6-f889-439f-8fec-ca7822ec63c3
cm"""## Better CommonMark.jl instead of Markdown.jl"""

# ╔═╡ df3301c4-196f-4ee1-bdf4-c81c71a1104e
cm"""Standard julia markdown `md"some markdown"` can behave in surprising and undesired ways"""

# ╔═╡ feae1368-a19d-4f0c-96b9-7081b593037a
var = 1

# ╔═╡ dfe2781e-ca0e-4cce-a1a0-34c3e913ece6
md"$(var) value is has newline. But next inline use of $(var) works as expected"

# ╔═╡ 7b9093a2-842b-4f65-bb35-57cf151d91f5
cm"""some more surprising behaviours"""

# ╔═╡ ef887980-c97d-41f1-954a-9783c0775654
md"""
$(1 + 1) $(1 + 1)

$(1 + 1)$(1 + 1)

 $(1 + 1) $(1 + 1)

 $(1 + 1)$(1 + 1)
"""

# ╔═╡ 5d1d2a4d-84f2-4bfa-bf15-e3698bb27b39
cm"""**The solution:** Using `cm"some markdown"` from the package CommonMark.jl"""

# ╔═╡ b4a00d0c-34f0-4d06-9f65-64b4a764a3f8
cm"
$(1 + 1) $(1 + 1)

$(1 + 1)$(1 + 1)

 $(1 + 1) $(1 + 1)

 $(1 + 1)$(1 + 1)
"

# ╔═╡ 414a0d99-85b3-4025-8631-2310d07a7116
cm"""## Better HypertextLiteral.jl than Html"""

# ╔═╡ d45cd163-62ab-4319-b6e5-1d3a6b4aa791
cm"""With html you cannot use standard interpolation"""

# ╔═╡ 799cc47b-9a65-4990-92ad-07b745341559
who = "😽"

# ╔═╡ 213c5b06-6125-4e8d-90e5-f6356a1deeb5
html"""
<p>Hello $(who)!</p>
"""

# ╔═╡ cc5aae01-9279-4cab-9ca7-45ecd7d09d29
cm"""**The solution:** Use `htl"..."` from the package HypertextLiteral.jl instead:"""

# ╔═╡ b908a9bf-6901-4a69-ba9e-a6ceff20fd9d
@htl("""
	<p> Hello $(who)!</p>
""")

# ╔═╡ 732d4457-55c2-408c-a2c9-bf1b50ac5fbc
cool_features = [
	cm"Interpolate any **HTML-showable object**, such as plots and images, or another `@htl` literal."
	cm"Interpolated lists are expanded _(like in this cell!)_."
	"Easy syntax for CSS"
]

# ╔═╡ f753db9b-dcfb-4e92-88c4-8ed2ed0bf2f2
@htl("""
	<p>It has a bunch of very cool features! Including:</p>
	<ul>$([
		@htl(
			"<li>$(item)</li>"
		)
		for item in cool_features
	])</ul>
""")

# ╔═╡ 713a6c7c-198c-417a-8d62-560db42d7ea4
cm"""## Useful HTML helpers"""

# ╔═╡ 1ca41340-f768-42d0-82d5-db37cfc7129e
cm"`embed_display`"

# ╔═╡ a304bd24-370b-4abf-a6d9-f7576b4452a2
@htl("""
<div style="display: flex;">
$(embed_display(rand(4)))
$(embed_display(rand(4)))
</div>
""")

# ╔═╡ a79bc022-e895-4e01-a0c1-28f26d23b22a
cm"`details`"

# ╔═╡ f9f707d1-1471-4ca9-a1ac-66973e061294
details(x, summary="Show more") = @htl("""
<details>
	<summary>$(summary)</summary>
	$(x)
</details>
""")

# ╔═╡ 5028238f-d4c3-4a7a-a2f4-d3cf83e18767
details("long content")

# ╔═╡ 6bb3ea1f-9bbf-4226-b554-ac7c5a86bb46
cm"""Admonitions"""

# ╔═╡ 422b8936-f2a0-4825-9d01-4076ab3d41a4
admonition(category, title, content) = Markdown.MD(Markdown.Admonition(category, title, [content]))

# ╔═╡ 24872f5f-de8b-4c36-bd25-df1440cac48d
admonition("warning", "WARNING: Not recommended!", cm"you can turn off reactivity entirely by wrapping it into a `Ref`")

# ╔═╡ f137a01d-9964-4588-aca3-350d97c2af35
begin
	admonition_categories = ["info", "note", "hint", "correct", "warning", "danger", "whatever"]	
	map(admonition_categories) do cat
		admonition(cat, cat, md"What  beautiful day.")
	end
end

# ╔═╡ 0980486b-dd4f-457a-b974-da3d6287d371
begin
	hint(text) = admonition("hint", "Hint", [text])
	
	almost(text) = admonition("warning", "Almost there!", [text])
	
	function keep_working(text=md"The answer is not quite right.")
		admonition("danger", "Keep working on it!", [text])
	end
	
	function correct(text=md"Great! You got the right answer! Let's move on to the next section.")
		admonition("correct", "Got it!", [text])
	end
end;

# ╔═╡ 5629f761-3068-4b90-99a6-ab08b06a3533
begin
	if z == 2x + y
		correct(cm"Congratulations 😸")
	else
		cm"""
		$(keep_working())
		$(hint(cm"try it with copy and paste 🗊"))
		"""
	end
end

# ╔═╡ a406aaf6-4c9d-4160-a747-0881166b18b5
hint(md"hello")

# ╔═╡ 2452a747-6e0f-4fbd-a46f-f3007f9601a0
cm"""# Other"""

# ╔═╡ 58f54383-d123-4c28-9d3b-36cf9585498d
cm""" ## Pluto's Builtin Pkg Manager

By default Pluto creates a blank environment just for your notebook and will install all packages `using MyPackage` into that new environment.

That will create `Project.toml` and `Manifest.toml` files, two standard julia files which describe your dependencies. 

Pluto stores the contents of[`Project.toml`and`Manifest.toml`](https://pkgdocs.julialang.org/v1/toml-files/)directly in the notebook file. For forwards-backwards compatibility, this is done using two extra "cells" at the bottom of the file, containing the two files as string literals. For example, here is a notebook that imports`HypertextLiteral`and`PlutoUI`:[`fonsp/Pluto file format demo.jl`](https://gist.github.com/fonsp/44e72741cefb6041506cb8c7040db1a7).
"""

# ╔═╡ 90233555-1edb-4f77-8e24-3c8921f7307d
cm"""
-------------

You can **deactive** this builtin package manager by activating a specific environment 

For example the following will activate the nearest surrounding julia environment (quite handy).
```julia
begin
    import Pkg
    # activate the shared project environment
    Pkg.activate(Base.current_project())

    using Plots, PlutoUI, LinearAlgebra
end
```

You can also use this to manually specify a completely new independent julia environment, including specific versions.

```julia
begin
    import Pkg
    # activate a temporary environment
    Pkg.activate(mktempdir())
    Pkg.add([
        Pkg.PackageSpec(name="Plots", version="1"),
        Pkg.PackageSpec(name="PlutoUI", version="0.7"),
    ])
    using Plots, PlutoUI, LinearAlgebra
end
```
"""

# ╔═╡ 2d511f23-07fc-4290-bace-001bedc09d0f
cm"""
## Restrictions when using Pluto

Currently, you cannot use 
* `Distributed`, and packages that use it ([#300](https://github.com/fonsp/Pluto.jl/issues/300))
* packages that use lots of macros to create their own syntax ([#196](https://github.com/fonsp/Pluto.jl/issues/196))
* `@async` in order to update values reactively. Use the `@bind`macro instead
"""

# ╔═╡ 40ea9be1-e45d-45dd-8f99-365f6ccf34d8
htl"""
$(md"## Pluto Dashboards - the bright Future")

Going to come within the next half year!!!

<div style="position: relative; right: 0; top: 0; z-index: 300;"><iframe src="https://www.youtube.com/embed/nRmLfB-bKdc?start=433" width=600 height=340  frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
"""

# ╔═╡ 2f5ce1cc-5de6-47c5-b72f-03aa779aba5c
cm"""## Favourite Other Pluto Notebooks

A selection of my favourite Pluto Notebooks published online.

1. copy the url 
2. Press and hold CTRL key and click on the Pluto logo at the very top
3. In the Pluto main window paste the url in the textfield “open from file”


|Description | URL |
|----|-------|
| interactive math puzzle for beginners | `https://raw.githubusercontent.com/fonsp/Pluto.jl/main/sample/Basic%20mathematics.jl` |
| interactive colour filters | `https://raw.githubusercontent.com/JuliaPluto/PlutoCon2021-demos/main/lukavdplas%20-%20Colour%20filters.jl` |
| super interactive story telling | `https://raw.githubusercontent.com/JuliaPluto/PlutoCon2021-demos/main/Moser%20%26%20Dorn%20%E2%80%94%20Interactive%20Storytelling%20-%20An%20Odyssey.jl` |
| interactive drawing | `https://raw.githubusercontent.com/JuliaPluto/PlutoCon2021-demos/main/PaulButler_PenPlottingWithPluto.jl` |
"""

# ╔═╡ 7058e0b8-a249-4d60-8b5c-4109c7b871f6
cm"""## Further Resources

- [official README](https://github.com/fonsp/Pluto.jl)
- [official FaQ/Wiki](https://github.com/fonsp/Pluto.jl/wiki)
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CommonMark = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
CommonMark = "~0.8.3"
HypertextLiteral = "~0.9.0"
PlutoUI = "~0.7.14"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "393ac9df4eb085c2ab12005fc496dae2e1da344e"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.3"

[[Crayons]]
git-tree-sha1 = "3f71217b538d7aaee0b69ab47d9b7724ca8afa0d"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.0.4"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[HypertextLiteral]]
git-tree-sha1 = "72053798e1be56026b81d4e2682dbe58922e5ec9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.0"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "a8709b968a1ea6abc2dc1967cb1db6ac9a00dfb6"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.5"

[[PlutoUI]]
deps = ["Base64", "Dates", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "d1fb76655a95bf6ea4348d7197b22e889a4375f4"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.14"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╟─77efb520-f7d4-44ad-8e8c-f649fb6953a8
# ╟─227285cb-0f4a-47ba-9037-143307d6f691
# ╠═67dcf398-fc6a-4963-a390-d3dcfc69ea8d
# ╠═a6741b19-d378-4279-a1e4-70c18eb20cb5
# ╠═415fd393-eca0-4630-9be5-8a8265560b0d
# ╠═f31bc6f0-4fd6-444f-89df-8680deea986d
# ╟─11c03bd1-8752-4b9d-a3c5-203fb7a5872f
# ╠═d055e80b-6efb-4f78-9506-a886139598d9
# ╟─7fce21a5-9e97-44ce-b76a-5711fb62cd3b
# ╠═68701cb6-71e9-4853-a8e8-7cbcaaaf234b
# ╠═b4d2b9a0-a4a5-4c14-9092-93b0570628dd
# ╟─24872f5f-de8b-4c36-bd25-df1440cac48d
# ╠═cc8c129e-c955-414c-a415-a1879152a007
# ╠═618a2046-573e-4d44-9dba-5800951994cd
# ╠═2e4084dd-acf1-4350-95b3-f0e77cb28953
# ╟─3c029c7f-752f-4c99-b465-2c19675d1732
# ╟─788c2f4b-1679-4b2b-adc7-21f26e0fd277
# ╟─506ddcb3-c9eb-4e23-8a01-040b4103487e
# ╠═c367af42-71ef-4401-93bd-d2ade01606f5
# ╟─5629f761-3068-4b90-99a6-ab08b06a3533
# ╠═8ea36f83-4110-4505-b2e4-8a29c68f5560
# ╠═b103e55f-0d03-404c-a574-f116cf878ab6
# ╠═306f0d0a-5151-4ea6-9eb2-1a7d700118f2
# ╠═053a6e13-cfa7-431e-84cf-0839c8250f97
# ╠═4ad1bae8-ba32-4060-b06a-a1e109cd06fa
# ╟─780677dd-cf4c-46f8-b9dc-37a12a288242
# ╠═5e970055-1076-4841-9d2b-ec75e7142a41
# ╠═7f1fc43b-3f40-4d5b-ba2b-71916ff9b436
# ╠═addf17dd-be2f-4cdc-952d-115061506532
# ╠═42e94190-dbae-46d3-9257-bf3318f65b9d
# ╠═cdf7ba93-ec68-4f36-a650-def062ba61f4
# ╟─227c49cb-e986-45a6-89be-5558fcf3dba1
# ╟─59fd9fa6-23a0-4ca5-97ce-091c5c74268d
# ╟─c7c8c86d-2de2-4862-9899-e63b78d24d29
# ╠═e458f2cc-cd31-4e32-83c1-3cfec6b89a6e
# ╟─37415d7a-4737-46ac-9f16-44d81ccc8793
# ╠═177bf468-c5f4-4b01-87c0-97a56f1e3109
# ╟─73840820-f592-4682-a3d4-de500c0669ae
# ╠═db2292c8-d3f0-459c-b478-1e95ccab863c
# ╠═93a0f206-77f0-4563-bfda-39b6571c39e8
# ╟─37c9fae8-0982-4026-83ac-0f913188a2bd
# ╠═40a43215-70b0-4d10-aee6-ddc7a4ce1257
# ╟─9d7c3d14-e0e5-43bc-99e7-81774bf325fe
# ╟─354694a6-f889-439f-8fec-ca7822ec63c3
# ╠═df3301c4-196f-4ee1-bdf4-c81c71a1104e
# ╠═feae1368-a19d-4f0c-96b9-7081b593037a
# ╠═dfe2781e-ca0e-4cce-a1a0-34c3e913ece6
# ╟─7b9093a2-842b-4f65-bb35-57cf151d91f5
# ╠═ef887980-c97d-41f1-954a-9783c0775654
# ╟─5d1d2a4d-84f2-4bfa-bf15-e3698bb27b39
# ╠═3ffae4f4-ee7d-4207-a37c-f759292be96e
# ╠═b4a00d0c-34f0-4d06-9f65-64b4a764a3f8
# ╟─414a0d99-85b3-4025-8631-2310d07a7116
# ╟─d45cd163-62ab-4319-b6e5-1d3a6b4aa791
# ╠═799cc47b-9a65-4990-92ad-07b745341559
# ╠═213c5b06-6125-4e8d-90e5-f6356a1deeb5
# ╠═cc5aae01-9279-4cab-9ca7-45ecd7d09d29
# ╠═f644142d-4146-43c0-8049-fb345282b31a
# ╠═b908a9bf-6901-4a69-ba9e-a6ceff20fd9d
# ╠═f753db9b-dcfb-4e92-88c4-8ed2ed0bf2f2
# ╟─732d4457-55c2-408c-a2c9-bf1b50ac5fbc
# ╟─713a6c7c-198c-417a-8d62-560db42d7ea4
# ╟─1ca41340-f768-42d0-82d5-db37cfc7129e
# ╠═a304bd24-370b-4abf-a6d9-f7576b4452a2
# ╟─a79bc022-e895-4e01-a0c1-28f26d23b22a
# ╠═5028238f-d4c3-4a7a-a2f4-d3cf83e18767
# ╠═f9f707d1-1471-4ca9-a1ac-66973e061294
# ╟─6bb3ea1f-9bbf-4226-b554-ac7c5a86bb46
# ╠═422b8936-f2a0-4825-9d01-4076ab3d41a4
# ╠═f137a01d-9964-4588-aca3-350d97c2af35
# ╠═a406aaf6-4c9d-4160-a747-0881166b18b5
# ╠═0980486b-dd4f-457a-b974-da3d6287d371
# ╟─2452a747-6e0f-4fbd-a46f-f3007f9601a0
# ╟─58f54383-d123-4c28-9d3b-36cf9585498d
# ╟─90233555-1edb-4f77-8e24-3c8921f7307d
# ╟─2d511f23-07fc-4290-bace-001bedc09d0f
# ╟─40ea9be1-e45d-45dd-8f99-365f6ccf34d8
# ╟─2f5ce1cc-5de6-47c5-b72f-03aa779aba5c
# ╟─7058e0b8-a249-4d60-8b5c-4109c7b871f6
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
