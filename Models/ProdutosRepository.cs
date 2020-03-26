using System.Collections.Generic;
namespace mvc1.Models
{
    public class ProdutosRepository : IRepository
    {
        private AppDbContext context;
        public void ProdutoRepository(AppDbContext ctx)
        {
            context = ctx;
        }
        public IEnumerable<Produto> Produtos => context.Produtos;
    }
}