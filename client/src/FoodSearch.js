
import React from 'react';
import Client from './Client';

const MATCHING_ITEM_LIMIT = 25;
const NUTRIENTS = ['Calcium, Ca', 'Iron, Fe', 'Magnesium, Mg', 'Phosphorus, P', 'Potassium, K', 'Sodium, Na', 'Zinc, Zn', 'Copper, Cu', 'Vitamin C, total ascorbic acid', 'Thiamin']

class FoodSearch extends React.Component {
  state = {
    foods: [],
    showRemoveIcon: false,
    searchValue: '',
  };

  handleSearchChange = (e) => {
    const value = e.target.value;

    this.setState({
      searchValue: value,
    });

    if (value === '') {
      this.setState({
        foods: [],
        showRemoveIcon: false,
      });
    } else {
      this.setState({
        showRemoveIcon: true,
      });

      Client.search(value, (foods) => {
        this.setState({
          foods: foods.slice(0, MATCHING_ITEM_LIMIT),
        });
      });
    }
  };

  handleSearchCancel = () => {
    this.setState({
      foods: [],
      showRemoveIcon: false,
      searchValue: '',
    });
  };

  render() {
    const { showRemoveIcon, foods } = this.state;
    const removeIconStyle = showRemoveIcon ? {} : { visibility: 'hidden' };

    const foodRows = foods.map((food, idx) => (
      <tr key={idx}>
        <td>{food.ret_code}</td>
        <td>{food.food_grp_code}</td>
        <td>{food.ret_desc}</td>
        {food.jsonified_nutrients.map((nutrient, idx) => {
          return NUTRIENTS.map((nutrient_name, _idx) => {
            if (nutrient.name == nutrient_name)
              return (<th key={idx}>{nutrient.level}</th>)
          })
        })}
      </tr>
    ));

    const nutrientsTh = NUTRIENTS.map(function(nutrient, idx) {
      return (
        <th key={idx}>{nutrient}</th>
      )
    })

    return (
      <div id='food-search'>
        <table className='ui selectable structured large table'>
          <thead>
            <tr>
              <th colSpan='13'>
                <div className='ui fluid search'>
                  <div className='ui icon input'>
                    <input
                      className='prompt'
                      type='text'
                      placeholder='Search foods...'
                      value={this.state.searchValue}
                      onChange={this.handleSearchChange}
                    />
                    <i className='search icon' />
                  </div>
                  <i
                    className='remove icon'
                    onClick={this.handleSearchCancel}
                    style={removeIconStyle}
                  />
                </div>
              </th>
            </tr>
            <tr>
              <th>Retention Code</th>
              <th>Food Group Code</th>
              <th className='four wide'>Retention Description</th>
              {nutrientsTh}
            </tr>
          </thead>
          <tbody>
            {foodRows}
          </tbody>
        </table>
      </div>
    );
  }
}

export default FoodSearch;
