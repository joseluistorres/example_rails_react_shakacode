import React, { PropTypes } from 'react';
import OptionSelect from '../containers/OptionSelect';
import Users from '../components/Users';
import MachineData from '../components/MachineData';

export default class Companies extends React.Component {
  constructor(props, context) {
    super(props, context);

    this.state = { 
      company_selected: this.props.company_selected,
      user_selected: this.props.user_selected,
      machine_data_selected: this.props.machine_data_selected
    };
  }

  _handleChange(event) {
    this.setState({
      company_selected: event.target.value
    })
  }

  _handleUserSelected(event) {
    this.setState({
      user_selected: event.target.value
    })
  }

  _handleMachineDataSelected(md_selected) {
    this.setState({
      machine_data_selected: md_selected
    })
  }

  render() {
    let internalNodes;
    internalNodes = this.props.companies.map(function(company, index) {
      return (
        <OptionSelect value={company.id} label={company.name} key={index} />
      );
    });

    return (
      <div className="row">
        <div className="form-group">
          <label>
            Choose a Company from the list:
          </label>
          <select value={this.state.company_selected} 
            className="form-control"
            onChange={this._handleChange.bind(this)}>
            <OptionSelect value='' label='' />
            {internalNodes}
          </select>
          <Users
           handleUserSelected={this._handleUserSelected.bind(this)}
           company_selected={this.state.company_selected} />
          <MachineData
           handleMachineDataSelected={this._handleMachineDataSelected.bind(this)}
           user_selected={this.state.user_selected} />
          <div className="form-group">
            <textarea
             value={this.state.machine_data_selected ? JSON.stringify(this.state.machine_data_selected.preread_json.ingredients) : ""}
             className={this.state.machine_data_selected ? '' : "hidden"}
             id="ingredients"
             rows="4" cols="50">
             </textarea>
          </div>
        </div>
      </div>
    );
  }
}
