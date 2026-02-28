import argparse
from pathlib import Path

import numpy as np
import pandas as pd


def build_age_group(age: pd.Series) -> pd.Series:
    bins = [18, 25, 35, 45, 55, 65, 91]
    labels = ["18-24", "25-34", "35-44", "45-54", "55-64", "65+"]
    return pd.cut(age, bins=bins, labels=labels, right=False)


def main(input_path: Path, output_path: Path, seed: int = 42) -> None:
    # Reproducibility
    rng = np.random.default_rng(seed)

    df = pd.read_csv(input_path)

    if "client_id" not in df.columns:
        raise ValueError("Input file must contain a 'client_id' column.")

    clients = (
        df[["client_id"]]
        .drop_duplicates()
        .sort_values("client_id")
        .reset_index(drop=True)
    )

    # Synthetic enrichment for segmentation demo purposes
    clients["gender"] = rng.choice(["Male", "Female"], size=len(clients), replace=True)

    ages = rng.normal(loc=40, scale=12, size=len(clients))
    ages = np.clip(ages, 18, 90).round().astype(int)
    clients["age"] = ages
    clients["age_group"] = build_age_group(clients["age"])

    clients["country"] = rng.choice(["BE", "FR", "NL", "IT", "DE"], size=len(clients), replace=True)

    output_path.parent.mkdir(parents=True, exist_ok=True)
    clients.to_csv(output_path, index=False)

    print(clients.head())


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Generate synthetic customer attributes for segmentation demos.")
    parser.add_argument("--input", required=True, help="Path to FactEvents CSV containing client_id.")
    parser.add_argument("--output", required=True, help="Path to output clients dimension CSV.")
    parser.add_argument("--seed", type=int, default=42, help="Random seed for reproducibility.")
    args = parser.parse_args()

    main(Path(args.input), Path(args.output), seed=args.seed)

### skew towards BE
clients["country"] = rng.choice(
    ["BE", "FR", "NL", "IT", "DE"],
    size=len(clients),
    p=[0.55, 0.15, 0.15, 0.08, 0.07]
)