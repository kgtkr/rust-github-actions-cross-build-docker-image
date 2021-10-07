#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!(
        "{:?}",
        reqwest::get("https://www.rust-lang.org")
            .await?
            .text()
            .await?
    );

    Ok(())
}
