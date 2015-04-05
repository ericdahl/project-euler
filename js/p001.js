var _ = require('lodash');

exports.solve = function() {
    return _.sum(_.range(1, 1000).filter(function(i) {
        return i % 3 === 0 || i % 5 === 0;
    }));
};