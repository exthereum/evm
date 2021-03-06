defmodule EVM.Mixfile do
  use Mix.Project

  def project do
    [
      app: :evm,
      version: "0.1.14",
      elixir: "~> 1.6",
      description: "Ethereum's Virtual Machine, in all its glory.",
      package: [
        maintainers: ["Geoffrey Hayes", "Ayrat Badykov", "Mason Forest"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/exthereum/evm"}
      ],
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [ignore_warnings: ".dialyzer.ignore-warnings"]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger], mod: {EVM.Application, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # To depend on another app inside the umbrella:
  #
  #   {:my_app, in_umbrella: true}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_rlp, "~> 0.3.0"},
      {:credo, "~> 0.9.1", only: [:dev, :test], runtime: false},
      {:poison, "~> 3.1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:merkle_patricia_tree,
       git: "git@github.com:poanetwork/merkle_patricia_tree.git", branch: 'update_ex_rlp'},
      {:keccakf1600, "~> 2.0.0", hex: :keccakf1600_orig},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end
end
