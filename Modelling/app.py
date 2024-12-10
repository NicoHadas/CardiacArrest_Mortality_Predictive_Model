from dash import dcc, html
import dash

# Initialize the Dash app
app = dash.Dash(__name__)

app.layout = html.Div([
    dcc.Tabs(id="tabs", value='tab-before', children=[
        dcc.Tab(label='Before Tuning', value='tab-before'),
        dcc.Tab(label='After Tuning', value='tab-after')
    ]),
    html.Div(id='tabs-content', style={'padding': '20px'})
])

@app.callback(
    dash.dependencies.Output('tabs-content', 'children'),
    [dash.dependencies.Input('tabs', 'value')]
)
def render_content(tab):
    if tab == 'tab-before':
        return html.Div([
            html.H3("ROC Curve Before Tuning", style={'text-align': 'center', 'margin-top': '20px'}),
            html.Img(
                src='/assets/ROC_Before.png', 
                style={
                    'width': '50%', 'max-width': '500px', 
                    'height': 'auto', 'display': 'block', 
                    'margin': '20px auto', 'border': '1px solid #ccc', 'border-radius': '10px'
                }),
            html.H3("Feature Importance Before Tuning", style={'text-align': 'center', 'margin-top': '20px'}),
            html.Img(
                src='/assets/FI_Before.png', 
                style={
                    'width': '50%', 'max-width': '500px', 
                    'height': 'auto', 'display': 'block', 
                    'margin': '20px auto', 'border': '1px solid #ccc', 'border-radius': '10px'
                }),
        ])
    elif tab == 'tab-after':
        return html.Div([
            html.H3("ROC Curve After Tuning", style={'text-align': 'center', 'margin-top': '20px'}),
            html.Img(
                src='/assets/ROC_After.png', 
                style={
                    'width': '50%', 'max-width': '500px', 
                    'height': 'auto', 'display': 'block', 
                    'margin': '20px auto', 'border': '1px solid #ccc', 'border-radius': '10px'
                }),
            html.H3("Feature Importance After Tuning", style={'text-align': 'center', 'margin-top': '20px'}),
            html.Img(
                src='/assets/FI_After.png', 
                style={
                    'width': '50%', 'max-width': '500px', 
                    'height': 'auto', 'display': 'block', 
                    'margin': '20px auto', 'border': '1px solid #ccc', 'border-radius': '10px'
                }),
        ])

if __name__ == '__main__':
    app.run_server(debug=True)