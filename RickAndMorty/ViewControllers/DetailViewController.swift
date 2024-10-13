//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Нина  on 11.10.2024.
//
import UIKit

class DetailViewController: UIViewController {
    
    private let stackView = UIStackView()
    private let viewModel: DetailViewModel
    private var id: Int
    let name = UILabel()
    let gender = UILabel()
    let image = UIImageView()
    let type = UILabel()
    let status = UILabel()
    let species = UILabel()
    
    init(viewModel: DetailViewModel, id: Int) {
        self.viewModel = viewModel
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.detailCharacter() {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(stackView)
        
        stackView.addSubview(name)
        stackView.addSubview(gender)
        stackView.addSubview(species)
        stackView.addSubview(image)
        stackView.addSubview(type)
        stackView.addSubview(status)
        
        name.textColor = .yellow
        name.font = UIFont.boldSystemFont(ofSize: 26)
        
        gender.textColor = .white
        gender.font = UIFont.boldSystemFont(ofSize: 26)
        
        species.textColor = .yellow
        species.font = UIFont.boldSystemFont(ofSize: 26)
        
        type.textColor = .white
        type.font = UIFont.boldSystemFont(ofSize: 26)
        
        status.textColor = .yellow
        status.font = UIFont.boldSystemFont(ofSize: 26)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fill
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        gender.snp.makeConstraints { make in
            make.top.equalTo(name).offset(40)
            make.centerX.equalToSuperview()
        }
        species.snp.makeConstraints { make in
            make.top.equalTo(gender).offset(40)
            make.centerX.equalToSuperview()
        }
        type.snp.makeConstraints { make in
            make.top.equalTo(species).offset(40)
            make.centerX.equalToSuperview()
        }
        status.snp.makeConstraints { make in
            make.top.equalTo(type).offset(40)
            make.centerX.equalToSuperview()
        }
        image.snp.makeConstraints { make in
            make.top.equalTo(status).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(400)
        }
    }
    
    private func updateUI() {
        guard let character = viewModel.getCharacter() else { return }
        
        name.text = character.name
        gender.text = character.gender
        species.text = character.species
        status.text = character.status
        type.text = character.type
        
        if let imageString = character.image, let imageURL = URL(string: imageString) {
            image.af.setImage(withURL: imageURL)
        } else {
            image.image = UIImage(named: "unknown")
        }
    }
}
