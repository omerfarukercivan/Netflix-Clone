//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Ömer Faruk Ercivan on 4.06.2023.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(downloadButton)
        
        configureConstraints()
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20 ),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25),
            downloadButton.widthAnchor.constraint(equalToConstant: 120),
            downloadButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configure(with model: TitlePreviewViewModel) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.ytVideo.id.videoId)") else { return }
        
        titleLabel.text = model.title
        overviewLabel.text = model.overview
        webView.load(URLRequest(url: url))
    }
}
