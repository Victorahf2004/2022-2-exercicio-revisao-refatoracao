#include "pizza_calabresa.hpp"



Pizza_calabresa::Pizza_calabresa(int q, float valor_unitario, int pedacos, bool borda_rech) : Pizza(q, valor_unitario, pedacos, borda_rech) {}

std::string Pizza_calabresa::get_sabor()
{
    return "Calabresa";
}