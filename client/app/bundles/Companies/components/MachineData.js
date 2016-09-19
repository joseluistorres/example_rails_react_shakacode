import React, { Component, PropTypes } from 'react';
import OptionSelect from '../containers/OptionSelect';

export default class MachineData extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user_selected: this.props.user_selected,
      machine_data: []
    }
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.user_selected != this.props.user_selected) {
      this.loadJSONdata(nextProps.user_selected);
    }
  }

  loadJSONdata(user_selected) {
    $.ajax({
      url: "/users/" + user_selected + "/machine_data",
      dataType: 'json',
      success: function(data) {
        this.setState({
          machine_data: data
        });
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(user_selected, status, err.toString());
      }.bind(this)
    });
  }

  _handleMDSelected(event) {
    let md_selected = this.state.machine_data.filter(function(md) {
      return md.id == event.target.value;
    })[0];

    this.props.handleMachineDataSelected(md_selected);
  }

  render () {
    let internalNodes;
    internalNodes = this.state.machine_data.map(function(md, index) {
      return (
        <OptionSelect value={md.id} label={md.name} key={index} />
      );
    });

    return (
      <div className="form-group">
        <select
         onChange={this._handleMDSelected.bind(this)}
         className={this.state.machine_data.length >=1 ? "form-control" : "form-control hidden"}>
        <OptionSelect value='' label='' />
         {internalNodes}
        </select>
      </div>

    );
  }
}
