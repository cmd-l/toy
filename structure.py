import dash
from dash import html
from pymatgen.core import Lattice, Structure,Species
from pymatgen.io.cif import CifParser

import crystal_toolkit.components as ctc

app = dash.Dash(__name__)
server = app.server

structure = CifParser("CsBeBr3_hss_uc_10_final.cif").parse_structures(primitive=False)

structure_component = ctc.StructureMoleculeComponent(structure[0], id="visualize")

layout = html.Div([structure_component.layout()])

ctc.register_crystal_toolkit(app=app, layout=layout)


if __name__ == "__main__":
    app.run_server(debug=True, host="0.0.0.0", port=8020)
