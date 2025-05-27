using Microsoft.EntityFrameworkCore;
using MovieStar.Domain.Entities;
using MovieStar.Domain.Interfaces;
using MovieStar.Infra.Data.Persistence;

namespace MovieStar.Infra.Data.Repositories
{
    public class UsuarioRepository : IUsuarioRepository
    {
        ApplicationDbContext _context;

        public UsuarioRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<Usuario> GetByEmailAsync(string email)
        {
            return await _context.Usuarios.FirstOrDefaultAsync( item => item.Email == email);
        }

        public async Task<IEnumerable<Usuario>> GetAllAsync()
        {
            return await _context.Usuarios.ToListAsync();
        }

        public async Task<Usuario> AddAsync(Usuario usuario)
        {
            _context.Add(usuario);
            await _context.SaveChangesAsync();
            return usuario;
        }

        public async Task<Usuario> UpdateAsync(Usuario usuario)
        {
            _context.Update(usuario);
            await _context.SaveChangesAsync();
            return usuario;
        }

        public async Task<Usuario> DeleteAsync(Usuario usuario)
        {
            _context.Remove(usuario);
            await _context.SaveChangesAsync();
            return usuario;
        }
    }
}