//
//  FeedSystem.swift
//  Profile Management System
//
//  Created by Балжан Бозбашава on 20.02.2025.
//
//Part 2 and 3
import Foundation

struct UserrProfile {
    let userID: String
    let username: String
    let bio: String
}

struct Post {
    let id: String
    let userID: String
    let content: String
    let hashtags: Set<String>
    let userrProfile: UserrProfile
}

class FeedSystem {
    //профили пользователей dictionary
    private var userCache: [String: UserrProfile] = [:]
    
    //хранение постов в порядке добавления array
    private var feedPosts: [Post] = []
    
    //уникальные хэштегов set
    private var hashtags: Set<String> = []

    func addPost(_ post: Post) {
        //добавление поста в начало массива
        feedPosts.insert(post, at: 0)
        //добавление хэштегов из поста в набор
        hashtags.formUnion(post.hashtags)
        //обновление профилей пользователей
        userCache[post.userID] = post.userrProfile
    }

    func removePost(_ post: Post) {
        //поиск и удаление поста из массива
        if let index = feedPosts.firstIndex(where: { $0.id == post.id }) {
            feedPosts.remove(at: index)
        }
        //опционально-> обновление набора хэштегов
        updateHashtagsAfterRemovingPost(post)
    }
    
    //для обновления хэштегов после удаления поста
    private func updateHashtagsAfterRemovingPost(_ post: Post) {
        //пройти по всем постам и перестроить набор хэштегов
        hashtags = Set(feedPosts.flatMap { $0.hashtags })
    }
}

//func testFeedSystem() {
//    let userrProfile = UserrProfile(userID: "user123", username: "JohnDoe", bio: "Here is John's bio")
//    let post = Post(id: "post123", userID: "user123", content: "Hello, world!", hashtags: ["#hello", "#world"], userrProfile: userrProfile)
//
//    let feedSystem = FeedSystem()
//    feedSystem.addPost(post)
//    
//    print(feedSystem.getFeedPosts()) //геттер изза private
//    feedSystem.removePost(post)
//    print(feedSystem.getFeedPosts())
//}
//
//testFeedSystem()

