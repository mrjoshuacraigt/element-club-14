//
//  SummaryTableViewCell.swift
//  element-club-14
//
//  Created by Joshua Taylor on 1/29/23.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) host not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var summary: SummaryModel? {
        didSet {
            guard let summary = summary else {return}
            titleBarTitleLabel.text = summary.exercise
            titleBarDate.text = summary.getDateTime()
            valueLabel.text = summary.perf
            valueUnitsLabel.text = summary.unit
            titleBarImageView.image = UIImage(systemName: helpers.getElementImageFromAction(exercise: summary.elementType))
            titleBarImageView.tintColor = helpers.getSummaryTitleColor(exercise: summary.elementType)
            titleBarTitleLabel.tintColor = helpers.getSummaryTitleColor(exercise: summary.elementType)
        }
    }
    
    
    let titleBarImageView: UIImageView = {
        let image = UIImage(systemName: "heart.fill")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let titleBarChevronImageView: UIImageView = {
        let image = UIImage(systemName: "chevron.right")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemGray
        
        return imageView
    }()
    
    let titleBarTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Title"
        
        return label
    }()
    
    let titleBarDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Data"
        
        return label
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "Value"
        
        return label
    }()
    
    let valueUnitsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = "units"
        
        return label
    }()
    
    
    func layout() {
        
        let titleStackView = UIStackView()
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.axis = .horizontal
        titleStackView.spacing = 4
        
        titleStackView.addArrangedSubview(titleBarImageView)
        titleStackView.addArrangedSubview(titleBarTitleLabel)
        titleStackView.addArrangedSubview(titleBarDate)
        titleStackView.addArrangedSubview(titleBarChevronImageView)
    
        
        
        
        let valueStackView = UIStackView()
        valueStackView.translatesAutoresizingMaskIntoConstraints = false
        valueStackView.axis = .horizontal
        valueStackView.addArrangedSubview(valueLabel)
        valueStackView.addArrangedSubview(valueUnitsLabel)
        valueStackView.spacing = 4
        
        addSubview(titleStackView)
        addSubview(valueStackView)
        
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 2),
            titleStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: titleStackView.trailingAnchor, multiplier: 2),
            
            valueStackView.topAnchor.constraint(equalToSystemSpacingBelow: titleStackView.bottomAnchor, multiplier: 3),
            valueStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: titleStackView.leadingAnchor, multiplier: 2),
            
            titleBarImageView.widthAnchor.constraint(equalToConstant: 20),
            titleBarImageView.heightAnchor.constraint(equalToConstant: 20)
            
            
        
        ])
        
        
    }

}
