#pragma once 

#include <boost/beast/core.hpp>
#include <boost/beast/http.hpp>
#include <memory>

namespace beast = boost::beast;         // from <boost/beast.hpp>
namespace http = beast::http;           // from <boost/beast/http.hpp>
namespace net = boost::asio;            // from <boost/asio.hpp>
using tcp = boost::asio::ip::tcp;       // from <boost/asio/ip/tcp.hpp>

class session : public std::enable_shared_from_this<session>
{
public:
    session(tcp::socket&& socket, std::shared_ptr<std::string const> const& doc_root);

    void run();

    void do_read();

    void on_read(beast::error_code ec, std::size_t bytes_transferred);
    
    void send_response(http::message_generator&& msg);

    void on_write(bool keep_alive, beast::error_code ec, std::size_t bytes_transferred);
    
    void do_close();
private:
    beast::tcp_stream stream_;
    beast::flat_buffer buffer_;
    std::shared_ptr<std::string const> doc_root_;
    http::request<http::string_body> req_;
};