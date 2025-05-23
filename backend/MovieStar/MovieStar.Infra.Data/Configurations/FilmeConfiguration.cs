using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MovieStar.Domain.Entities;

namespace MovieStar.Infra.Data.Configurations
{
    public class FilmeConfiguration : IEntityTypeConfiguration<Filme>
    {
        public void Configure(EntityTypeBuilder<Filme> builder)
        {
            builder.ToTable("Filmes");

            builder.HasKey(f => f.Id);

            builder.Property(f => f.Nome)
                .IsRequired()
                .HasMaxLength(100);

            builder.Property(f => f.Descricao)
                .IsRequired()
                .HasMaxLength(500);

            builder.HasMany(f => f.Genero)
                .WithMany()
                .UsingEntity(j => j.ToTable("FilmeGeneros"));

            builder.Property(f => f.Duracao)
                .IsRequired();

            builder.Property(f => f.DataLancamento)
                .IsRequired();

            builder.Property(f => f)
                .IsRequired();
            builder.Property(f => f.FaixaEtaria)
                .IsRequired();
            builder.Property(f => f.Origem)
                .IsRequired()
                .HasMaxLength(50);
            builder.Property(f => f.Imagem)
                .IsRequired()
                .HasColumnType("bytea");

            
        }
    }
}