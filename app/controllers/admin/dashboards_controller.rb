class Admin::DashboardsController < Admin::BaseController
  def index
    @dashboards = [
      {
        title: 'Buletin',
        url: admin_posts_path,
        icon: "fas fa-newspaper"
      },
      {
        title: 'Kegiatan',
        url: admin_events_path,
        icon: 'fas fa-calendar'
      },
      {
        title: 'Staff',
        url: admin_employees_path,
        icon: 'fas fa-users'
      },
      {
        title: 'Video',
        url: admin_videos_path,
        icon: 'fas fa-camera'
      },
      {
        title: 'Galeri',
        url: admin_galleries_path,
        icon: 'fas fa-images'
      },
      {
        title: 'Komentar',
        url: admin_comments_path,
        icon: 'fas fa-comments'
      },
      {
        title: 'Kategori',
        url: admin_categories_path,
        icon: 'fas fa-tags'
      },
      {
        title: 'Pages',
        url: admin_static_pages_path,
        icon: 'fas fa-file'
      }
    ]
  end
end
