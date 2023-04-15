import json
import random

jsonfile = "stats.json"


def select(f, n: int, u: int):
    """Select randomly n projects with u Union type classes.

    Parameters
    ----------
    f : any
        The JSON file descriptor.F

    n : int
        The number of projects to select.

    u: int
        The number of Union type classes.

    Returns
    -------
    list
        A list of randomly selected projects.
    """
    # Select projects with u Union type classes
    valid_projects = [
        project for project in projects if project["unions"] == u]

    return valid_projects if (len(valid_projects) < n) else random.sample(valid_projects, n)


if __name__ == "__main__":
    # Load the JSON file
    with open(jsonfile) as f:
        projects = json.load(f)

    # Select 5 projects with 0 Union type class and write it on a JSON file
    with open("0_union.json", "w") as f:
        json.dump(select(projects, 5, 0), f)

    # Select 5 projects with 4 Union type class and write it on a JSON file
    with open("4_union.json", "w") as f:
        json.dump(select(projects, 5, 4), f)
