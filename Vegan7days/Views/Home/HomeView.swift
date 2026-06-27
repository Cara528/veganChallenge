import SwiftUI

struct HomeView: View {
    @State private var challengeCompleted = false

    var body: some View {
        ZStack {
            Color(hex: "F4FBF4")
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // MARK: - Header
                    VStack(alignment: .leading, spacing: 4) {
                        Text("歡迎回來，Cara")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(Color(hex: "8D8D8D"))

                        HStack(spacing: 6) {
                            Text("🌱")
                            Text("Vegan 挑戰第 1 天")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(Color(hex: "303030"))
                        }
                    }
                    .padding(.top, 24)

                    // MARK: - 今日任務進行中
                    Text("今日任務進行中")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color(hex: "53B175"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(hex: "53B175"), lineWidth: 1.5)
                        )

                    // MARK: - 今日任務
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("邀請朋友到素食餐廳")
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(Color(hex: "303030"))
                                .lineLimit(2)

                            Button(action: {
                                challengeCompleted.toggle()
                            }) {
                                Text(challengeCompleted ? "已完成 ✓" : "完成")
                                    .font(.system(size: 13))
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(hex: "8D8D8D"), lineWidth: 1)
                                    )
                                    .foregroundColor(challengeCompleted ? Color(hex: "53B175") : Color(hex: "303030"))
                            }
                        }

                        Spacer()

                        Image("icon_vegangirl")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)

                    // MARK: - 本週進度
                    Text("本週進度")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(Color(hex: "303030"))

                    HStack(spacing: 0) {
                        VStack(spacing: 6) {
                            Text("1")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color(hex: "53B175"))
                            Text("已完成")
                                .font(.system(size: 12))
                                .foregroundColor(Color(hex: "8D8D8D"))
                        }
                        .frame(maxWidth: .infinity)

                        Divider().frame(height: 36)

                        VStack(spacing: 6) {
                            Text("6")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color(hex: "303030"))
                            Text("剩餘任務")
                                .font(.system(size: 12))
                                .foregroundColor(Color(hex: "8D8D8D"))
                        }
                        .frame(maxWidth: .infinity)

                        Divider().frame(height: 36)

                        VStack(spacing: 6) {
                            Text("7")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color(hex: "303030"))
                            Text("總任務數")
                                .font(.system(size: 12))
                                .foregroundColor(Color(hex: "8D8D8D"))
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)

                    // MARK: - 激勵文字
                    ZStack(alignment: .trailing) {
                        Image("bg_earth")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 140)
                            .clipped()

                        VStack(alignment: .trailing, spacing: 4) {
                            Text("你的選擇")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)

                            Text("改變世界的一點")
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                        }
                        .padding(80)
                    }
                    .cornerRadius(20)
//                    .shadow(color: .black.opacity(0.08), radius: 8, y: 3)

                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
            }
        }
    }
}

#Preview {
    HomeView()
}
